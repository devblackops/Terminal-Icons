function Set-TerminalIconsColorTheme {
    [cmdletbinding()]
    param(
        [parameter(mandatory)]
        [string]$Name
    )

    Set-Theme -Name $Name -Type Color
}
