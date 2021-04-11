function Set-TerminalIconsIconTheme {
    <#
    .SYNOPSIS
        Set the Terminal-Icons icon theme.
    .DESCRIPTION
        Set the Terminal-Icons icon theme to a registered theme.
    .PARAMETER Name
        The name of a registered icon theme.
    .EXAMPLE
        PS> Set-TerminalIconsIconTheme -Name devblackops

        Set the icon theme to 'devblackops'.
    .INPUTS
        System.String

        The name of a registered icon theme.
    .OUTPUTS
        None.
    .LINK
        Set-TerminalIconsColorTheme
    .LINK
        Get-TerminalIconsColorTheme
    .LINK
        Get-TerminalIconsIconTheme
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ArgumentCompleter({
            (Get-TerminalIconsIconTheme).Keys | Sort-Object
        })]
        [string]$Name
    )

    process {
        Write-Warning "$($MyInvocation.MyCommand.Name) has been deprecated and will be removed in a later version. Please use [Set-TerminalIconsTheme] to set the theme"
        Set-Theme -Name $Name -Type Icon
    }
}
