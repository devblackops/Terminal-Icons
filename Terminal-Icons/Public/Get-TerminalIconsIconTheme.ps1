function Get-TerminalIconsIconTheme {
    <#
    .SYNOPSIS
        List the available icon themes.
    .DESCRIPTION
        List the available icon themes.
    .Example
        PS> Get-TerminalIconsIconTheme

        Get the list of available icon themes.
    .INPUTS
        None.
    .OUTPUTS
        System.Collections.Hashtable

        An array of hashtables representing available icon themes.
    .LINK
        Get-TerminalIconsColorTheme
    .LINK
        Get-TerminalIconsTheme
    #>
    [OutputType([String])]
    [CmdletBinding()]
    param(
        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:current
    )

    $CurrentSettings.Themes.Icon
}
