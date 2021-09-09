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
    [CmdletBinding()]
    param()

    $iconTheme = if ($script:userThemeData.CurrentIconTheme) {
        [pscustomobject]$script:userThemeData.Themes.Icon[$script:userThemeData.CurrentIconTheme]
    } else {
        $null
    }

    $colorTheme = if ($script:userThemeData.CurrentColorTheme) {
        [pscustomobject]$script:userThemeData.Themes.Color[$script:userThemeData.CurrentColorTheme]
    } else {
        $null
    }

    [pscustomobject]@{
        PSTypeName = 'TerminalIconsTheme'
        Color      = $colorTheme
        Icon       = $iconTheme
    }
}
