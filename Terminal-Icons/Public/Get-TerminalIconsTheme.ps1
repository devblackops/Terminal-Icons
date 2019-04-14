function Get-TerminalIconsTheme {
    [cmdletbinding()]
    param(
        [switch]$ListAvailable
    )

    # if (-not $ListAvailable.IsPresent) {
        [pscustomobject]@{
            PSTypeName = 'TerminalIconsTheme'
            Color      = [pscustomobject]$script:currentTheme.color
            Icon       = [pscustomobject]$script:currentTheme.icon
        }
    # } else {

    #      $block = "`u{2588}"
    #     'Current theme:'
    #     "Color: $($script:currentTheme.color.name)"
    #     "Icon:  $($script:currentTheme.icon.name)"
    #     [System.Environment]::NewLine

    #     'Directories:'
    #     '  Well-known:'

    #     $script:currentTheme.color.types.directories.wellKnown.GetEnumerator().Foreach({
    #         $icon = $script:currentTheme.icon.types.directories.wellKnown[$_.Name]
    #         [pscustomobject]@{
    #             Directory  = $_.Value + $icon + ' ' + $_.Name
    #             ColorValue = $_.Value + $color.Reset + [regex]::Escape($_.Value)
    #             Block      = $_.Value + ($block*8) +$color.Reset

    #         }
    #         #'    ' + $_.Value + ($block*8) + '  ' + $_.Name + $color.Reset
    #     })

    #     [System.Environment]::NewLine
    #     "  Default:"
    #     '    ' + $script:currentTheme.color.types.directories[''] + ($block*8) + '  ' + 'Example' + $color.Reset

    #     'Files:'
    #     '  Well-known:'
    #     $script:currentTheme.color.types.files.wellKnown.GetEnumerator().Foreach({
    #         '    ' + $_.Value + ($block*8) + '  ' + $_.Name + $color.Reset
    #     })

    #     [System.Environment]::NewLine
    #     "  Default:"
    #     '    ' + $script:currentTheme.color.types.files[''] + ($block*8) + '  ' + 'Example' + $color.Reset
    # }
}
