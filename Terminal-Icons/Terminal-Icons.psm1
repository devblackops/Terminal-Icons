
# Dot source public/private functions
$public  = @(Get-ChildItem -Path ([IO.Path]::Combine($PSScriptRoot, 'Public/*.ps1'))  -Recurse -ErrorAction Stop)
$private = @(Get-ChildItem -Path ([IO.Path]::Combine($PSScriptRoot, 'Private/*.ps1')) -Recurse -ErrorAction Stop)
@($public + $private).ForEach({
    try {
        . $_.FullName
    } catch {
        throw $_
        $PSCmdlet.ThrowTerminatingError("Unable to dot source [$($import.FullName)]")
    }
})

$glyphs     = . $PSScriptRoot/Data/glyphs.ps1
$escape     = [char]27
$colorReset = "${escape}[0m"

# Import module theme files
$colorThemes = @{}

# Converted color themes
$script:colorSequences = @{}

(Get-ChildItem -Path $PSScriptRoot/Data/colorThemes -Filter '*.psd1').Foreach({

    # Import the color theme and convert to escape sequences
    $colorData = ConvertFrom-Psd1 $_.FullName
    $script:colorSequences[$_.Basename] = @{
        Name = $colorData.Name
        Types = @{
            Directories = @{
                #''        = "`e[0m"
                WellKnown = @{}
            }
            Files = @{
                #''        = "`e[0m"
                WellKnown = @{}
            }
        }
    }
    # Directories
    $colorData.Types.Directories.WellKnown.GetEnumerator().ForEach({
        $script:colorSequences[$colorData.Name].Types.Directories[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })
    # Wellknown files
    $colorData.Types.Files.WellKnown.GetEnumerator().ForEach({
        $script:colorSequences[$colorData.Name].Types.Files.WellKnown[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })
    # File extensions
    $colorData.Types.Files.GetEnumerator().Where({$_.Name -ne 'WellKnown'}).ForEach({
        $script:colorSequences[$colorData.Name].Types.Files[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })

    $colorThemes.Add($colorData.Name, $colorData)
    $colorThemes[$colorData.Name].Types.Directories[''] = $colorReset
    $colorThemes[$colorData.Name].Types.Files['']       = $colorReset
})
$iconThemes = @{}
(Get-ChildItem -Path $PSScriptRoot/Data/iconThemes).Foreach({
    $iconThemes.Add($_.Basename, (Import-PowerShellDataFile -Path $_.FullName))
})

$defaultTheme = 'devblackops'

# Import local theme data
$themePath = Get-ThemeStoragePath
$themeBasePath = Split-Path $themePath
if (-not (Test-Path $themeBasePath)) {
    New-Item -Path $themeBasePath -ItemType Directory -Force
}

if (Test-Path $themePath) {
    $themeData = Import-CliXml -Path $themePath
}
if (-not $themeData) {
    # We have no theme data saved (first time use?)
    # Create one and save it
    $themeData = @{
        CurrentIconTheme  = $defaultTheme
        CurrentColorTheme = $defaultTheme
        Themes = @{
            Color = $colorThemes
            Icon  = $iconThemes
        }
    }
} else {
    # Load or set default theme (if missing)
    if ([string]::IsNullOrEmpty($themeData.CurrentColorTheme)) {
        $themeData.CurrentColorTheme = $defaultTheme
    }
    if ([string]::IsNullOrEmpty($themeData.CurrentIconTheme)) {
        $themeData.CurrentIconTheme = $defaultTheme
    }

    if ($null -eq $themeData.Themes -or $themeData.Themes.Count -eq 0) {
        $themeData.Themes = @{
            Color = @{}
            Icon  = @{}
        }
    }

    # Update the builtin themes
    $colorThemes.GetEnumerator().ForEach({
        $themeData.Themes.Color[$_.Name] = $_.Value
    })
    $iconThemes.GetEnumerator().ForEach({
        $themeData.Themes.Icon[$_.Name] = $_.Value
    })
}

$themeData | Export-Clixml -Path $themePath -Force

Export-ModuleMember -Function $public.Basename

Update-FormatData -Prepend ([IO.Path]::Combine($PSScriptRoot, 'Terminal-Icons.format.ps1xml'))
