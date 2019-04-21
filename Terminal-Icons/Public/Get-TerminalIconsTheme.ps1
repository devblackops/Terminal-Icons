function Get-TerminalIconsTheme {
    [cmdletbinding()]
    param(
        [switch]$ListAvailable
    )

    [pscustomobject]@{
        PSTypeName = 'TerminalIconsTheme'
        Color      = [pscustomobject]$script:currentTheme.color
        Icon       = [pscustomobject]$script:currentTheme.icon
    }
}
