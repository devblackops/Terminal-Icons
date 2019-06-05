function Set-TerminalIconsIconTheme {
    [cmdletbinding()]
    param(
        [parameter(mandatory)]
        [string]$Name
    )

    Set-Theme -Name $Name -Type Icon
}
