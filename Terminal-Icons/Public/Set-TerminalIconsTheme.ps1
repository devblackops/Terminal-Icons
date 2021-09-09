function Set-TerminalIconsTheme {
    <#
    .SYNOPSIS
        Set the Terminal-Icons color or icon theme
    .DESCRIPTION
        Set the Terminal-Icons color or icon theme to the given name.
    .PARAMETER ColorTheme
        The name of a registered color theme to use.
    .PARAMETER IconTheme
        The name of a registered icon theme to use.
    .PARAMETER DisableColorTheme
        Disables custom colors and uses default terminal color.
    .PARAMETER DisableIconTheme
        Disables custom icons and shows only shows the directory or file name.
    .PARAMETER Force
        Bypass confirmation messages.
    .EXAMPLE
        PS> Set-TerminalIconsTheme -ColorTheme devblackops

        Set the color theme to 'devblackops'.
    .EXAMPLE
        PS> Set-TerminalIconsTheme -IconTheme devblackops

        Set the icon theme to 'devblackops'.
    .EXAMPLE
        PS> Set-TerminalIconsTheme -DisableIconTheme

        Disable Terminal-Icons custom icons and only show custom colors.
    .EXAMPLE
        PS> Set-TerminalIconsTheme -DisableColorTheme

        Disable Terminal-Icons custom colors and only show custom icons.
    .INPUTS
        System.String

        The name of the color or icon theme to use.
    .OUTPUTS
        None.
    .LINK
        Get-TerminalIconsColorTheme
    .LINK
        Get-TerminalIconsIconTheme
    .LINK
        Get-TerminalIconsTheme
    .NOTES
        This function supercedes Set-TerminalIconsColorTheme and Set-TerminalIconsIconTheme. They have been deprecated.
    #>
    [cmdletbinding(SupportsShouldProcess, DefaultParameterSetName = 'theme')]
    param(
        [Parameter(ParameterSetName = 'theme')]
        [ArgumentCompleter({
            (Get-TerminalIconsIconTheme).Keys | Sort-Object
        })]
        [string]$IconTheme,

        [Parameter(ParameterSetName = 'theme')]
        [ArgumentCompleter({
            (Get-TerminalIconsColorTheme).Keys | Sort-Object
        })]
        [string]$ColorTheme,

        [Parameter(ParameterSetName = 'notheme')]
        [switch]$DisableColorTheme,

        [Parameter(ParameterSetName = 'notheme')]
        [switch]$DisableIconTheme,

        [switch]$Force
    )

    if ($DisableIconTheme.IsPresent) {
        Set-Theme -Name $null -Type Icon
    }

    if ($DisableColorTheme.IsPresent) {
        Set-Theme -Name $null -Type Color
    }

    if ($ColorTheme) {
        if ($Force -or $PSCmdlet.ShouldProcess($ColorTheme, 'Set color theme')) {
            Set-Theme -Name $ColorTheme -Type Color
        }
    }

    if ($IconTheme) {
        if ($Force -or $PSCmdlet.ShouldProcess($IconTheme, 'Set icon theme')) {
            Set-Theme -Name $IconTheme -Type Icon
        }
    }
}

