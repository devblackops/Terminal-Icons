function Get-TerminalIconsTheme {
    <#
    .SYNOPSIS
        Get the currently applied color and icon theme.
    .DESCRIPTION
        Get the currently applied color and icon theme.
    .EXAMPLE
        PS> Get-TerminalIconsTheme

        Get the currently applied Terminal-Icons color and icon theme.
    .INPUTS
        None.
    .OUTPUTS
        System.Management.Automation.PSCustomObject

        An object representing the currently applied color and icon theme.
    .LINK
        Get-TerminalIconsColorTheme
    .LINK
        Get-TerminalIconsIconTheme
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding()]
    param(
        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:current
    )

    $iconTheme  = $CurrentSettings.IconTheme ? [pscustomobject]$CurrentSettings.Themes.Icon[$CurrentSettings.IconTheme] : $null
    $colorTheme = $CurrentSettings.ColorTheme ? [pscustomobject]$CurrentSettings.Themes.Color[$CurrentSettings.ColorTheme] : $null

    [pscustomobject]@{
        PSTypeName = 'TerminalIconsTheme'
        Color      = $colorTheme
        Icon       = $iconTheme
    }
}
