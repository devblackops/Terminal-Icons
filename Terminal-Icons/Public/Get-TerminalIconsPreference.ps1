function Get-TerminalIconsPreference {
    <#
    .SYNOPSIS
        Gets the current preferences for Terminal-Icons.
    .DESCRIPTION
        Gets the current preferences for Terminal-Icons.
    .EXAMPLE
        Get-TerminalIconsPreference

        Get the current preferences for Terminal-Icons.
    .INPUTS
        None
    .OUTPUTS
        TerminalIcons preferences
    .LINK
        Set-TerminalIconsPreference
    #>
    [CmdletBinding()]
    param()

    $script:prefs
}
