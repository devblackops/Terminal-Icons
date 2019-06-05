function Resolve-Icon {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    if ($FileInfo.PSIsContainer) {
        # Determine directory icon

        $iconName  = $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Directories.WellKnown[$FileInfo.Name]
        if (-not $iconName) {
            $iconName =  $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Directories[$FileInfo.Name]
            if (-not $iconName) {
                $iconName =  $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Directories['']
            }
        }
        $icon = $glyphs[$iconName]

        # Determine directory color
        $color = $themeData.Themes.Color[$themeData.CurrentColorTheme].Types.Directories.WellKnown[$FileInfo.Name]
        if (-not $color) {
            $color = $themeData.Themes.Color[$themeData.CurrentColorTheme].Types.Directories[$FileInfo.Name]
            if (-not $color) {
                $color = $themeData.Themes.Color[$themeData.CurrentColorTheme].Types.Directories['']
            }
        }
    } else {
        # Determine file icon
        $iconName = $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Files.WellKnown[$FileInfo.Name]
        if (-not $iconName) {
            $iconName = $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Files[$FileInfo.Extension]
            if (-not $iconName) {
                $iconName = $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Files['']
            }
        }
        $icon = $glyphs[$iconName]

        # Determine file color
        $themeData.Themes.Color[$themeData.CurrentColorTheme]
        $color = $themeData.Themes.Color[$themeData.CurrentColorTheme].Types.Files.WellKnown[$FileInfo.Name]
        if (-not $color) {
            $color = $themeData.Themes.Color[$themeData.CurrentColorTheme].Types.Files[$FileInfo.Extension]
            if (-not $color) {
                $color = $themeData.Themes.Color[$themeData.CurrentColorTheme].Types.Files['']
            }
        }
    }

    @{
        Icon  = $icon
        Color = $color
    }
}
