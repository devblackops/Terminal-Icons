enum RendorMode {
    Normal
    Bold
    Italic
    Underline
}

enum DateTimeFormat {
    ISO8601
    HUMANIZE
    SORTABLE
    RFC1123
    GENERAL_SHORT_TIME
    GENERAL_LONG_TIME
    FULL_SHORT_TIME
    FULL_LONG_TIME
}

enum TimeZoneDisplay {
    Local
    UTC
}

enum FileSizeDisplay {
    Bytes
    KB_MB_GB
}

class Preferences {
    [string]$IconTheme                = 'devblackops'
    [string]$ColorTheme               = 'devblackops'
    [RendorMode]$RendorMode           = [RendorMode]::Bold
    [DateTimeFormat]$DateTimeFormat   = [DateTimeFormat]::GENERAL_SHORT_TIME
    [TimeZoneDisplay]$TimeZoneDisplay = [TimeZoneDisplay]::Local
    [FileSizeDisplay]$FileSizeDisplay = [FileSizeDisplay]::Bytes
}

# Helper vars
$moduleRoot    = $PSScriptRoot
$escape        = [char]27
$colorReset    = "${escape}[0m"
$bold          = "${escape}[1m"
$italic        = "${escape}[3m"
$underline     = "${escape}[4m"
$defaultTheme  = 'devblackops'
$prefsFile     = 'preferences.xml'
$userThemePath = Get-ThemeStoragePath

# Load or create default preferences
$prefs = Import-Preferences

# To speed up module load times, the theme files are not imported on module load
# Instead, the they are loaded on the first invocation of `Format-TerminalIcons`
$themeFilesLoaded = $false
$iconThemes       = @{}
$colorThemes      = @{}
$colorSequences   = @{}
$glyphs           = @{}

$current = Get-CurrentSettings

# As of 0.12.0, we no longer save the builtin theme files in the user theme folder
('devblackops_color.xml', 'devblackops_light_color.xml', 'devblackops_icon.xml').ForEach({
    if (Test-Path $userThemePath/$_) {
        Remove-Item $userThemePath/$_ -ErrorAction SilentlyContinue
    }
})

# TODO: Store the user themes pre-processes to speed things up
# TODO: Also only load user themes if they are the active theme
# # Load any user-defined themes]
# $builtinColorThemes = Get-ChildItem $moduleRoot/Data/colorThemes -File
# (Get-ChildItem $userThemePath -Filter '*_icon.xml').Where({$_.Name -notin $builtinColorThemes.Name}).ForEach({
#     $userIconTheme = Import-CliXml -Path $_.FullName
#     $current.Themes.Icon[$userIconTheme.Name] = $userIconTheme
# })
# $builtinIconThemes = Get-ChildItem $moduleRoot/Data/iconThemes -File
# (Get-ChildItem $userThemePath -Filter '*_color.xml').Where({$_.Name -notin $builtinIconThemes.Name}).ForEach({
#     $userColorTheme = Import-CliXml -Path $_.FullName
#     $current.Themes.Color[$userColorTheme.Name] = $userColorTheme
#     $colorSequences[$userColorTheme.Name] = ConvertTo-ColorSequence -ColorData $userColorTheme
# })

Save-Preferences -Preferences $prefs

$formatFile = $IsWindows ? 'Terminal-Icons.format.ps1xml' : 'Terminal-Icons.format_nix.ps1xml'
Update-FormatData -PrependPath ([IO.Path]::Combine($moduleRoot, $formatFile))
