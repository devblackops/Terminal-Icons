function Get-CurrentSettings {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [OutputType([hashtable])]
    param(
        [Preferences]$Preferences = $script:prefs,

        [string]$DefaultTheme = $script:defaultTheme
    )

    # Default settings
    $current = @{
        IconTheme            = $DefaultTheme
        ColorTheme           = $DefaultTheme
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

    $current.IconTheme            = $Preferences.IconTheme
    $current.ColorTheme           = $Preferences.ColorTheme
    $current.RendorModeUnicode    = Get-RendorModeUnicode $Preferences.RendorMode
    $current.DataTimeFormat       = $Preferences.DateTimeFormat
    $current.DateTimeFormatString = Get-DateTimeFormatString $Preferences.DateTimeFormat
    $current.TimeZoneDisplay      = $Preferences.TimeZoneDisplay
    $current.FileSizeDisplay      = $Preferences.FileSizeDisplay

    $current
}
