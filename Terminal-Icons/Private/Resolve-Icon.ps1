function Resolve-Icon {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    if ($FileInfo.PSIsContainer) {
        # Determine directory icon
        $iconName  = $currentTheme.Icon.Types.Directories.WellKnown[$FileInfo.Name]
        if (-not $iconName) {
            $iconName = $CurrentTheme.Icon.Types.Directories[$FileInfo.Name]
            if (-not $iconName) {
                $iconName = $currentTheme.Icon.Types.Directories['']
            }
        }
        $icon = $glyphs[$iconName]

        # Determine directory color
        $color = $currentTheme.Color.Types.Directories.WellKnown[$FileInfo.Name]
        if (-not $color) {
            $color = $currentTheme.Color.Types.Directories[$FileInfo.Name]
            if (-not $color) {
                $color = $currentTheme.Color.Types.Directories['']
            }
        }
    } else {
        # Determine file icon
        $iconName = $currentTheme.Icon.Types.Files.WellKnown[$FileInfo.Name]
        if (-not $iconName) {
            $iconName = $currentTheme.Icon.Types.Files[$FileInfo.Extension]
            if (-not $iconName) {
                $iconName = $currentTheme.Icon.Types.Files['']
            }
        }
        $icon = $glyphs[$iconName]

        # Determine file color
        $color = $currentTheme.Color.Types.Files.WellKnown[$FileInfo.Name]
        if (-not $color) {
            $color = $currentTheme.Color.Types.Files[$FileInfo.Extension]
            if (-not $color) {
                $color = $currentTheme.Color.Types.Files['']
            }
        }
    }

    @{
        Icon  = $icon
        Color = $color
    }
}
