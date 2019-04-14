function Resolve-Icon {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    if ($FileInfo.PSIsContainer) {
        # Determine directory icon
        $icon  = $currentTheme.Icon.Types.Directories.WellKnown[$FileInfo.Name]
        if (-not $icon) {
            $icon = $CurrentTheme.Icon.Types.Directories[$FileInfo.Name]
            if (-not $icon) {
                $icon = $currentTheme.Icon.Types.Directories['']
            }
        }

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
        $icon = $currentTheme.Icon.Types.Files.WellKnown[$FileInfo.Name]
        if (-not $icon) {
            $icon = $currentTheme.Icon.Types.Files[$FileInfo.Extension]
            if (-not $icon) {
                $icon = $currentTheme.Icon.Types.Files['']
            }
        }

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
