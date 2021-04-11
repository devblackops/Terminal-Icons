# Dot source public/private functions
# $public  = @(Get-ChildItem -Path ([IO.Path]::Combine($PSScriptRoot, 'Public/*.ps1'))  -Recurse -ErrorAction Stop)
# $private = @(Get-ChildItem -Path ([IO.Path]::Combine($PSScriptRoot, 'Private/*.ps1')) -Recurse -ErrorAction Stop)
# @($public + $private).ForEach({
#     try {
#         . $_.FullName
#     } catch {
#         throw $_
#         $PSCmdlet.ThrowTerminatingError("Unable to dot source [$($import.FullName)]")
#     }
# })

$glyphs                = . $PSScriptRoot/Data/glyphs.ps1
$escape                = [char]27
$colorReset            = "${escape}[0m"
$defaultTheme          = 'devblackops'

# Import builtin icon/color themes and convert colors to escape sequences
$iconThemes            = @{}
$script:colorThemes    = @{}
$script:colorSequences = @{}
Get-ChildItem -Path $PSScriptRoot/Data/iconThemes |
    Import-IconTheme -IconThemes $script:iconThemes
Get-ChildItem -Path $PSScriptRoot/Data/colorThemes -Filter '*.psd1' |
    Import-ColorTheme -ColorThemes $colorThemes -ColorSequences $script:colorSequences

# Import user theme data
$userThemePath = Get-ThemeStoragePath
$userThemeBasePath = Split-Path $userThemePath
if (-not (Test-Path $userThemeBasePath)) {
    New-Item -Path $userThemeBasePath -ItemType Directory -Force
}
if (Test-Path $userThemePath) {
    $script:userThemeData = Import-CliXml -Path $userThemePath
}
if (-not $script:userThemeData) {
    # We have no theme data saved (first time use?)
    # Create one and save it
    $script:userThemeData = @{
        CurrentIconTheme  = $defaultTheme
        CurrentColorTheme = $defaultTheme
        Themes = @{
            Color = $colorThemes
            Icon  = $iconThemes
        }
    }
} else {
    # Load or set default theme (if missing)
    if ([string]::IsNullOrEmpty($script:userThemeData.CurrentColorTheme)) {
        $script:userThemeData.CurrentColorTheme = $defaultTheme
    }
    if ([string]::IsNullOrEmpty($script:userThemeData.CurrentIconTheme)) {
        $script:userThemeData.CurrentIconTheme = $defaultTheme
    }

    if ($null -eq $script:userThemeData.Themes -or $script:userThemeData.Themes.Count -eq 0) {
        $script:userThemeData.Themes = @{
            Color = @{}
            Icon  = @{}
        }
    }

    # Update the builtin themes
    $colorThemes.GetEnumerator().ForEach({
        $script:userThemeData.Themes.Color[$_.Name] = $_.Value
    })
    $iconThemes.GetEnumerator().ForEach({
        $script:userThemeData.Themes.Icon[$_.Name] = $_.Value
    })
}

$script:userThemeData | Export-Clixml -Path $userThemePath -Force

# Export-ModuleMember -Function $public.Basename

Update-FormatData -Prepend ([IO.Path]::Combine($PSScriptRoot, 'Terminal-Icons.format.ps1xml'))
