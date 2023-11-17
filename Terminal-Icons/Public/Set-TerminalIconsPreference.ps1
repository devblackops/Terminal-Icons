function Set-TerminalIconsPreference {
    <#
    .SYNOPSIS
        Set preferences for Terminal-Icons.
    .DESCRIPTION
        Set preferences for Terminal-Icons.
    .PARAMETER IconTheme
        The icon theme to use.
    .PARAMETER ColorTheme
        The color theme to use.
    .PARAMETER DateTimeFormat
        The date/time format to use.
    .PARAMETER TimeZoneDisplay
        The time zone to display dates as.
    .PARAMETER RendorMode
        The rendor mode to use.
    .PARAMETER FileSizeDisplay
        The file size display to use.
    .PARAMETER PassThru
        Return the preferences object.
    .EXAMPLE
        Set-TerminalIconsPreference -RenderMode Bold

        Use bold font for folder and files names.
    .EXAMPLE
        Set-TerminalIconsPreference -DateTimeFormat ISO8601

        Use the ISO 8601 date/time format when displaying dates.
    .LINK
        Get-TerminalIconsPreference
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [cmdletbinding()]
    param(
        [ArgumentCompleter({
            (Get-TerminalIconsIconTheme).Keys | Sort-Object
        })]
        [string]$IconTheme,

        [ArgumentCompleter({
            (Get-TerminalIconsColorTheme).Keys | Sort-Object
        })]
        [string]$ColorTheme,

        [ArgumentCompleter({
            [Enum]::GetNames('DateTimeFormat') | Sort-Object
        })]
        [DateTimeFormat]$DateTimeFormat,

        [ArgumentCompleter({
            [Enum]::GetNames('TimeZoneDisplay') | Sort-Object
        })]
        [TimeZoneDisplay]$TimeZoneDisplay,

        [ArgumentCompleter({
            [Enum]::GetNames('RendorMode') | Sort-Object
        })]
        [RendorMode]$RendorMode,

        [ArgumentCompleter({
            [Enum]::GetNames('FileSizeDisplay') | Sort-Object
        })]
        [FileSizeDisplay]$FileSizeDisplay,

        [Parameter(DontShow)]
        [Preferences]$Preferences = $script:prefs,

        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:Current,

        [switch]$PassThru
    )

    if ($IconTheme) {
        $Preferences.IconTheme = $IconTheme
        $CurrentSettings.IconTheme = $IconTheme
    }

    if ($ColorTheme) {
        $Preferences.ColorTheme = $ColorTheme
        $CurrentSettings.ColorTheme = $ColorTheme
    }

    if ($PSBoundParameters.ContainsKey('DateTimeFormat')) {
        $Preferences.DateTimeFormat = $DateTimeFormat
        $CurrentSettings.DateTimeFormat = $DateTimeFormat
        $CurrentSettings.DateTimeFormatString = Get-DateTimeFormatString $DateTimeFormat
    }

    if ($PSBoundParameters.ContainsKey('TimeZoneDisplay')) {
        $Preferences.TimeZoneDisplay = $TimeZoneDisplay
        $CurrentSettings.TimeZoneDisplay = $TimeZoneDisplay
    }

    if ($PSBoundParameters.ContainsKey('RendorMode')) {
        $Preferences.RendorMode = $RendorMode
        $CurrentSettings.RendorModeUnicode = Get-RendorModeUnicode $RendorMode
    }

    if ($PSBoundParameters.ContainsKey('FileSizeDisplay')) {
        $Preferences.FileSizeDisplay = $FileSizeDisplay
        $CurrentSettings.FileSizeDisplay = $FileSizeDisplay
    }

    Save-Preferences $Preferences

    if ($PassThru) {
        $Preferences
    }
}
