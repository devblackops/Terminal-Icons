function Resolve-Icon {
    [OutputType([hashtable])]
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [IO.FileSystemInfo]$FileInfo
    )

    process {
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
            $color = $script:colorSequences[$themeData.CurrentColorTheme].Types.Directories.WellKnown[$FileInfo.Name]
            if (-not $color) {
                $color = $script:colorSequences[$themeData.CurrentColorTheme].Types.Directories[$FileInfo.Name]
                if (-not $color) {
                    $color = $script:colorSequences[$themeData.CurrentColorTheme].Types.Directories['']
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
            $color = $script:colorSequences[$themeData.CurrentColorTheme].Types.Files.WellKnown[$FileInfo.Name]
            if (-not $color) {
                $color = $script:colorSequences[$themeData.CurrentColorTheme].Types.Files[$FileInfo.Extension]
                if (-not $color) {
                    $color = $script:colorSequences[$themeData.CurrentColorTheme].Types.Files['']
                }
            }
        }

        @{
            Icon  = $icon
            Color = $color
        }
    }
}
