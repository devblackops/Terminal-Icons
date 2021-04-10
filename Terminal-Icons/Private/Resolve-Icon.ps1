function Resolve-Icon {
    [OutputType([hashtable])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [IO.FileSystemInfo]$FileInfo,

        [string]$IconTheme = $script:userThemeData.CurrentIconTheme,

        [string]$ColorTheme = $script:userThemeData.CurrentColorTheme
    )

    begin {
        $icons  = $script:userThemeData.Themes.Icon[$IconTheme]
        $colors = $script:colorSequences[$ColorTheme]
    }

    process {
        $displayInfo = @{
            Icon     = $null
            Color    = $null
            Target   = ''
        }

        if ($FileInfo.PSIsContainer) {
            $type = 'Directories'
        } else {
            $type = 'Files'
        }

        switch ($FileInfo.LinkType) {
            # Determine symlink or junction icon and color
            'Junction' {
                $iconName = $icons.Types.($type)['junction']
                $colorSeq = $colors.Types.($type)['junction']
                $displayInfo['Target'] = ' -> ' + $FileInfo.Target
                break
            }
            'SymbolicLink' {
                $iconName = $icons.Types.($type)['symlink']
                $colorSeq = $colors.Types.($type)['symlink']
                $displayInfo['Target'] = ' -> ' + $FileInfo.Target
                break
            } default {
                # Determine normal directory icon and color
                $iconName = $icons.Types.$type.WellKnown[$FileInfo.Name]
                if (-not $iconName) {
                    if ($FileInfo.PSIsContainer) {
                        $iconName = $icons.Types.$type[$FileInfo.Name]
                    } elseif ($icons.Types.$type.ContainsKey($FileInfo.Extension)) {
                        $iconName = $icons.Types.$type[$FileInfo.Extension]
                    } else {
                        # File probably has multiple extensions
                        # Fallback to computing the full extension
                        $firstDot = $FileInfo.Name.IndexOf('.')
                        if ($firstDot -ne -1) {
                            $fullExtension = $FileInfo.Name.Substring($firstDot)
                            $iconName = $icons.Types.$type[$fullExtension]
                        }
                    }
                    if (-not $iconName) {
                        $iconName = $icons.Types.$type['']
                    }
                }
                $colorSeq = $colors.Types.$type.WellKnown[$FileInfo.Name]
                if (-not $colorSeq) {
                    if ($FileInfo.PSIsContainer) {
                        $colorSeq = $colors.Types.$type[$FileInfo.Name]
                    } elseif ($colors.Types.$type.ContainsKey($FileInfo.Extension)) {
                        $colorSeq = $colors.Types.$type[$FileInfo.Extension]
                    } else {
                        # File probably has multiple extensions
                        # Fallback to computing the full extension
                        $firstDot = $FileInfo.Name.IndexOf('.')
                        if ($firstDot -ne -1) {
                            $fullExtension = $FileInfo.Name.Substring($firstDot)
                            $colorSeq = $colors.Types.$type[$fullExtension]
                        }
                    }
                    if (-not $colorSeq) {
                        $colorSeq = $colors.Types.$type['']
                    }
                }
            }
        }
        $displayInfo['Icon']  = $glyphs[$iconName]
        $displayInfo['Color'] = $colorSeq
        $displayInfo
    }
}
