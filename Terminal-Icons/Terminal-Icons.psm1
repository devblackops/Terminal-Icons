
# Dot source public/private functions
$public  = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Public/*.ps1')  -Recurse -ErrorAction Stop)
$private = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Private/*.ps1') -Recurse -ErrorAction Stop)
@($public + $private).ForEach({
    try {
        . $_.FullName
    } catch {
        throw $_
        $PSCmdlet.ThrowTerminatingError("Unable to dot source [$($import.FullName)]")
    }
})

$glyphs = . $PSScriptRoot/Data/glyphs.ps1

# Import module theme files
$colorThemes = @{}
(Get-ChildItem -Path $PSScriptRoot/Data/colorThemes -Filter '*.psd1').Foreach({

    # Import the color theme and convert to escape sequences
    $colorData = Import-PowerShellDataFile -Path $_
    $colorTheme = @{
        Name = $colorData.Name
        Types = @{
            Directories = @{
                ''        = "`e[0m"
                WellKnown = @{

                }
            }
            Files = @{
                ''        = "`e[0m"
                WellKnown = @{

                }
            }
        }
    }

    # Directories
    $colorData.Types.Directories.WellKnown.GetEnumerator().ForEach({
        $directoryName = $_.Name
        $rgbColor      = $_.Value.Replace('#', '')
        $r = [convert]::ToInt32($rgbColor.SubString(0,2), 16)
        $g = [convert]::ToInt32($rgbColor.SubString(2,2), 16)
        $b = [convert]::ToInt32($rgbColor.SubString(4,2), 16)
        $colorSequence = "`e[38;2;$r;$g;$b`m"
        $colorTheme.Types.Directories[$directoryName] = $colorSequence
    })

    # Wellknown files
    $colorData.Types.Files.WellKnown.GetEnumerator().ForEach({
        $fileName = $_.Name
        $rgbColor = $_.Value.Replace('#', '')
        $r = [convert]::ToInt32($rgbColor.SubString(0,2), 16)
        $g = [convert]::ToInt32($rgbColor.SubString(2,2), 16)
        $b = [convert]::ToInt32($rgbColor.SubString(4,2), 16)
        $colorSequence = "`e[38;2;$r;$g;$b`m"
        $colorTheme.Types.Files.WellKnown[$fileName] = $colorSequence
    })

    # File extensions
    $colorData.Types.Files.GetEnumerator().Where({$_.Name -ne 'WellKnown'}).ForEach({
        $extension = $_.Name
        $rgbColor  = $_.Value.Replace('#', '')
        $r = [convert]::ToInt32($rgbColor.SubString(0,2), 16)
        $g = [convert]::ToInt32($rgbColor.SubString(2,2), 16)
        $b = [convert]::ToInt32($rgbColor.SubString(4,2), 16)
        $colorSequence = "`e[38;2;$r;$g;$b`m"
        $colorTheme.Types.Files[$extension] = $colorSequence
    })

    $colorThemes.Add($_.Basename, $colorTheme)
})
$iconThemes = @{}
(Get-ChildItem -Path $PSScriptRoot/Data/iconThemes).Foreach({
    $iconThemes.Add($_.Basename, (Import-PowerShellDataFile -Path $_))
})

$defaultTheme = 'devblackops'

# Import local theme data
$global:themeData = Import-Configuration
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

# $currentTheme = @{
#     Color = $themeData.Themes.Color[$themeData.CurrentColorTheme]
#     Icon  = $themeData.Themes.Icon[$themeData.CurrentIconTheme]
# }

$themeData | Export-Configuration

# # Import current themes
# $currentTheme = Import-Configuration
# if ($currentTheme.Keys.Count -eq 0) {
#     Write-Warning 'No Terminal-Icons theme set. Using default [Jaykul]...'
#     $currentTheme = @{
#         Color = $colorThemes.Jaykul
#         Icon  = $iconThemes.Jaykul
#     }
# }
# $currentTheme | Export-Configuration

Export-ModuleMember -Function $public.Basename

Update-FormatData -Prepend (Join-Path $PSScriptRoot 'Terminal-Icons.format.ps1xml')
