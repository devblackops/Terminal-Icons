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
                if ($icons) {
                    $iconName = $icons.Types.($type)['junction']
                } else {
                    $iconName = $null
                }
                if ($colors) {
                    $colorSeq = $colors.Types.($type)['junction']
                } else {
                    $colorSet = $script:colorReset
                }
                $displayInfo['Target'] = ' ' + $glyphs['nf-md-arrow_right_thick'] + ' ' + $FileInfo.Target
                break
            }
            'SymbolicLink' {
                if ($icons) {
                    $iconName = $icons.Types.($type)['symlink']
                } else {
                    $iconName = $null
                }
                if ($colors) {
                    $colorSeq = $colors.Types.($type)['symlink']
                } else {
                    $colorSet = $script:colorReset
                }
                $displayInfo['Target'] = ' ' + $glyphs['nf-md-arrow_right_thick'] + ' ' + $FileInfo.Target
                break
            } default {
                if ($icons) {
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

                        # Fallback if everything has gone horribly wrong
                        if (-not $iconName) {
                            if ($FileInfo.PSIsContainer) {
                                $iconName = 'nf-oct-file_directory'
                            } else {
                                $iconName = 'nf-fa-file'
                            }
                        }
                    }
                } else {
                    $iconName = $null
                }
                if ($colors) {
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

                        # Fallback if everything has gone horribly wrong
                        if (-not $colorSeq) {
                            $colorSeq = $script:colorReset
                        }
                    }
                } else {
                    $colorSeq = $script:colorReset
                }
            }
        }
        if ($iconName) {
            $displayInfo['Icon'] = $glyphs[$iconName]
        } else {
            $displayInfo['Icon'] = $null
        }
        $displayInfo['Color'] = $colorSeq
        $displayInfo
    }
}
