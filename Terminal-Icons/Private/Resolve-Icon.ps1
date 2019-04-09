function Resolve-Icon {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    if ($FileInfo.PSIsContainer) {

        # Determine directory icon
        $icon  = $currentTheme.icon.types.directories.wellKnown[$FileInfo.Name]
        if (-not $icon) {
            $icon = $currentTheme.icon.types.directories[$FileInfo.Name]
            if (-not $icon) {
                $icon = $currentTheme.icon.types.directories['']
            }
        }

        # Determine directory color
        $color = $currentTheme.color.types.directories.wellKnown[$FileInfo.Name]
        if (-not $color) {
            $color = $currentTheme.color.types.directories[$FileInfo.Name]
            if (-not $color) {
                $color = $currentTheme.color.types.directories['']
            }
        }

        $displayInfo = @{
            Icon  = $icon
            Color = $color
        }
    } else {
        # Determine file icon
        $icon = $currentTheme.icon.types.files.wellKnown[$FileInfo.Name]
        if (-not $icon) {
            $icon = $currentTheme.icon.types.files[$FileInfo.Extension]
            if (-not $icon) {
                $icon = $currentTheme.icon.types.files['']
            }
        }


        $color = $currentTheme.color.types.files.wellKnown[$FileInfo.Name]
        if (-not $color) {
            $color = $currentTheme.color.types.files[$FileInfo.Extension]
            if (-not $color) {
                $color = $currentTheme.color.types.files['']
            }
        }

        $displayInfo = @{
            Icon  = $icon
            Color = $color
        }
    }

    $displayInfo
}
