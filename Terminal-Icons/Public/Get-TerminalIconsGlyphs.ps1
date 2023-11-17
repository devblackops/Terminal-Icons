function Get-TerminalIconsGlyphs {
    <#
    .SYNOPSIS
        Gets the list of glyphs known to Terminal-Icons.
    .DESCRIPTION
        Gets a hashtable with the available glyph names and icons. Useful in creating a custom theme.
    .EXAMPLE
        PS> Get-TerminalIconsGlyphs

        Gets the table of glyph names and icons.
    .INPUTS
        None.
    .OUTPUTS
        None.
    .LINK
        Get-TerminalIconsIconTheme
    .LINK
        Set-TerminalIconsIcon
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [OutputType([String])]
    [CmdletBinding()]
    param(
        [Parameter(DontShow)]
        [hashtable]$Glyphs = $script:glyphs
    )

    # This is also helpful for argument completers needing glyphs -
    # ArgumentCompleterAttribute isn't able to access script variables but it
    # CAN call commands.
    $Glyphs.GetEnumerator() | Sort-Object Name
}
