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

$moduleRoot    = $PSScriptRoot
$glyphs        = . $moduleRoot/Data/glyphs.ps1
$escape        = [char]27
$colorReset    = "${escape}[0m"
$defaultTheme  = 'devblackops'
$userThemePath = Get-ThemeStoragePath
$userThemeData = @{
    CurrentIconTheme  = $null
    CurrentColorTheme = $null
    Themes = @{
        Color = @{}
        Icon  = @{}
    }
}

# Import builtin icon/color themes and convert colors to escape sequences
$colorSequences = @{}
$iconThemes     = Import-IconTheme
$colorThemes    = Import-ColorTheme
$colorThemes.GetEnumerator().ForEach({
    $colorSequences[$_.Name] = ConvertTo-ColorSequence -ColorData $_.Value
})

# Load or create default prefs
$prefs = Import-Preferences

# Set current theme
$userThemeData.CurrentIconTheme  = $prefs.CurrentIconTheme
$userThemeData.CurrentColorTheme = $prefs.CurrentColorTheme

# Load user icon and color themes
# We're ignoring the old 'theme.xml' from Terimal-Icons v0.3.1 and earlier
# A corrupt theme file is skipped so it doesn't break module import
(Get-ChildItem $userThemePath -Filter '*_icon.xml').ForEach({
    $themeFile = $_.FullName
    try {
        $userIconTheme = Import-CliXmlWithRetry -Path $themeFile
    } catch {
        Write-Warning "Unable to parse [$themeFile]. Skipping icon theme."
        return
    }
    if ($userIconTheme.Name) {
        $userThemeData.Themes.Icon[$userIconTheme.Name] = $userIconTheme
    }
})
(Get-ChildItem $userThemePath -Filter '*_color.xml').ForEach({
    $themeFile = $_.FullName
    try {
        $userColorTheme = Import-CliXmlWithRetry -Path $themeFile
    } catch {
        Write-Warning "Unable to parse [$themeFile]. Skipping color theme."
        return
    }
    if ($userColorTheme.Name) {
        $userThemeData.Themes.Color[$userColorTheme.Name] = $userColorTheme
        $colorSequences[$userColorTheme.Name] = ConvertTo-ColorSequence -ColorData $userThemeData.Themes.Color[$userColorTheme.Name]
    }
})

# Update the builtin themes
$colorThemes.GetEnumerator().ForEach({
    $userThemeData.Themes.Color[$_.Name] = $_.Value
})
$iconThemes.GetEnumerator().ForEach({
    $userThemeData.Themes.Icon[$_.Name] = $_.Value
})

# Save all themes to theme path
$userThemeData.Themes.Color.GetEnumerator().ForEach({
    $colorThemePath = Join-Path $userThemePath "$($_.Name)_color.xml"
    $_.Value | Export-CliXmlAtomic -Path $colorThemePath
})
$userThemeData.Themes.Icon.GetEnumerator().ForEach({
    $iconThemePath = Join-Path $userThemePath "$($_.Name)_icon.xml"
    $_.Value | Export-CliXmlAtomic -Path $iconThemePath
})

Save-Preferences -Preferences $prefs

# Export-ModuleMember -Function $public.Basename

Update-FormatData -Prepend ([IO.Path]::Combine($moduleRoot, 'Terminal-Icons.format.ps1xml'))
