function Get-TerminalIconsColorTheme {
    <#
    .SYNOPSIS
        List the available color themes.
    .DESCRIPTION
        List the available color themes.
    .Example
        PS> Get-TerminalIconsColorTheme

        Get the list of available color themes.
    .INPUTS
        None.
    .OUTPUTS
        System.Collections.Hashtable

        An array of hashtables representing available color themes.
    .LINK
        Get-TerminalIconsIconTheme
    .LINK
        Get-TerminalIconsTheme
    #>
    [OutputType([String])]
    [CmdletBinding()]
    param(
        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:current
    )

    $CurrentSettings.Themes.Color
}
