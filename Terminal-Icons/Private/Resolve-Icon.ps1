function Resolve-Icon {
    [OutputType([hashtable])]
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [IO.FileSystemInfo]$FileInfo
    )

    begin {
        $icons  = $script:themeData.Themes.Icon[$themeData.CurrentIconTheme]
        $colors = $script:colorSequences[$themeData.CurrentColorTheme]
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
                    } else {
                        $iconName = $icons.Types.$type[$FileInfo.Extension]
                    }
                    if (-not $iconName) {
                        $iconName = $icons.Types.$type['']
                    }
                }
                $colorSeq = $colors.Types.$type.WellKnown[$FileInfo.Name]
                if (-not $colorSeq) {
                    if ($FileInfo.PSIsContainer) {
                        $colorSeq = $colors.Types.$type[$FileInfo.Name]
                    } else {
                        $colorSeq = $colors.Types.$type[$FileInfo.Extension]
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
