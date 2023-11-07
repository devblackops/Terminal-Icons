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
$userThemePath = Get-ThemeStoragePath

# Default settings
$current = @{
    IconTheme            = $defaultTheme
    ColorTheme           = $defaultTheme
    RendorModeUnicode    = Get-RendorModeUnicode 'Bold'
    DateTimeFormat       = [DateTimeFormat]::GENERAL_SHORT_TIME
    DateTimeFormatString = 'g'
    TimeZoneDisplay      = [TimeZoneDisplay]::Local
    FileSizeDisplay      = [FileSizeDisplay]::Bytes
    Themes = @{
        Color = @{}
        Icon  = @{}
    }
}

# Load builtin theme data
$iconThemes     = Import-Clixml -Path $moduleRoot/Data/iconThemes.xml
$colorThemes    = Import-Clixml -Path $moduleRoot/Data/colorThemes.xml
$colorSequences = Import-Clixml -Path $moduleRoot/Data/colorSequences.xml
$glyphs         = Import-Clixml -Path $moduleRoot/Data/glyphs.xml

# Load or create default prefs
$prefs = Import-Preferences

# Set current settings
$current.IconTheme            = $prefs.IconTheme
$current.ColorTheme           = $prefs.ColorTheme
$current.RendorModeUnicode    = Get-RendorModeUnicode $prefs.RendorMode
$current.DataTimeFormat       = $prefs.DateTimeFormat
$current.DateTimeFormatString = Get-DateTimeFormatString $prefs.DateTimeFormat
$current.TimeZoneDisplay      = $prefs.TimeZoneDisplay
$current.FileSizeDisplay      = $prefs.FileSizeDisplay
$current.Themes = @{
    Color = $colorThemes
    Icon  = $iconThemes
}

# As of 0.12.0, we no longer save the builtin theme files in the user theme folder
('devblackops_color.xml', 'devblackops_light_color.xml', 'devblackops_icon.xml').ForEach({
    Remove-Item $userThemePath/$_ -ErrorAction SilentlyContinue
})

# Load any user-defined themes]
(Get-ChildItem $userThemePath -Filter '*_icon.xml').ForEach({
    $userIconTheme = Import-CliXml -Path $_.FullName
    $current.Themes.Icon[$userIconTheme.Name] = $userIconTheme
})
(Get-ChildItem $userThemePath -Filter '*_color.xml').ForEach({
    $userColorTheme = Import-CliXml -Path $_.FullName
    $current.Themes.Color[$userColorTheme.Name] = $userColorTheme
    $colorSequences[$userColorTheme.Name] = ConvertTo-ColorSequence -ColorData $userColorTheme
})

Save-Preferences -Preferences $prefs

# Export-ModuleMember -Function $public.Basename

$formatFile = $IsWindows ? 'Terminal-Icons.format.ps1xml' : 'Terminal-Icons.format_nix.ps1xml'
Update-FormatData -Prepend ([IO.Path]::Combine($moduleRoot, $formatFile))
