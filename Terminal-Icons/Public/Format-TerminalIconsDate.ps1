function Format-TerminalIconsDate {
    <#
    .SYNOPSIS
        Format a date according to the user's preferences.
    .DESCRIPTION
        Format a date according to the user's preferences.
    .PARAMETER DateTime
        The date to format.
    .EXAMPLE
        Format-TerminalIconsDate -DateTime (Get-Date)
    .INPUTS
        System.DateTime
    .OUTPUTS
        System.String
    #>
    [OutputType([String])]
    [CmdletBinding()]
    param(
        [datetime]$DateTime,

        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:current
    )

    if ($CurrentSettings.DateTimeFormat -eq [DateTimeFormat]::HUMANIZE) {
        $isUtc = $CurrentSettings.TimeZoneDisplay -eq [DataTimeZone]::UTC
        $DateTime.Humanize($isUtc)
    } else {
        if ($CurrentSettings.TimeZoneDisplay -eq [TimeZoneDisplay]::UTC) {
            $DateTime.ToUniversalTime().ToString($CurrentSettings.DateTimeFormatString)
        } else {
            $DateTime.ToString($CurrentSettings.DateTimeFormatString)
        }
    }
}
