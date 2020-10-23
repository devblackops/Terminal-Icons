function Set-TerminalIconsColorTheme {
    <#
    .SYNOPSIS
        Set the Terminal-Icons color theme.
    .DESCRIPTION
        Set the Terminal-Icons color theme to a registered theme.
    .PARAMETER Name
        The name of a registered color theme.
    .EXAMPLE
        PS> Set-TerminalIconsColorTheme -Name devblackops

        Set the color theme to 'devblackops'.
    .INPUTS
        System.String

        The name of a registered color theme.
    .OUTPUTS
        None.
    .LINK
        Set-TerminalIconsIconTheme
    .LINK
        Get-TerminalIconsColorTheme
    .LINK
        Get-TerminalIconsIconTheme
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]$Name
    )

    process {
        Set-Theme -Name $Name -Type Color
    }
}
