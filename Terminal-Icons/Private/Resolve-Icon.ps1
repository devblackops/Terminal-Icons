function Resolve-Icon {
    [OutputType([hashtable])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateScript({
            # Accept both local FileSystemInfo objects and deserialized objects from remoting
            if ($_ -is [IO.FileSystemInfo]) {
                return $true
            }
            # Check TypeNames array for deserialized objects
            $matches = $_.PSObject.TypeNames -match '^Deserialized\.System\.IO\.(DirectoryInfo|FileInfo)$'
            return ($null -ne $matches -and $matches.Count -gt 0)
        })]
        [PSObject]$FileInfo,

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

        # Safe property access for both local and deserialized objects
        $isContainer = if ($FileInfo.PSObject.Properties['PSIsContainer']) {
            $FileInfo.PSIsContainer
        } else {
            $false
        }
        $linkType = if ($FileInfo.PSObject.Properties['LinkType']) {
            $FileInfo.LinkType
        } else {
            $null
        }
        $target = if ($FileInfo.PSObject.Properties['Target']) {
            $FileInfo.Target
        } else {
            $null
        }
        $name = if ($FileInfo.PSObject.Properties['Name']) {
            $FileInfo.Name
        } else {
            ''
        }
        $extension = if ($FileInfo.PSObject.Properties['Extension']) {
            $FileInfo.Extension
        } else {
            ''
        }

        if ($isContainer) {
            $type = 'Directories'
        } else {
            $type = 'Files'
        }

        switch ($linkType) {
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
                if ($target) {
                    $displayInfo['Target'] = ' ' + $glyphs['nf-md-arrow_right_thick'] + ' ' + $target
                }
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
                if ($target) {
                    $displayInfo['Target'] = ' ' + $glyphs['nf-md-arrow_right_thick'] + ' ' + $target
                }
                break
            } default {
                if ($icons) {
                    # Determine normal directory icon and color
                    $iconName = $icons.Types.$type.WellKnown[$name]
                    if (-not $iconName) {
                        if ($isContainer) {
                            $iconName = $icons.Types.$type[$name]
                        } elseif ($icons.Types.$type.ContainsKey($extension)) {
                            $iconName = $icons.Types.$type[$extension]
                        } else {
                            # File probably has multiple extensions
                            # Fallback to computing the full extension
                            $firstDot = $name.IndexOf('.')
                            if ($firstDot -ne -1) {
                                $fullExtension = $name.Substring($firstDot)
                                $iconName = $icons.Types.$type[$fullExtension]
                            }
                        }
                        if (-not $iconName) {
                            $iconName = $icons.Types.$type['']
                        }

                        # Fallback if everything has gone horribly wrong
                        if (-not $iconName) {
                            if ($isContainer) {
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
                    $colorSeq = $colors.Types.$type.WellKnown[$name]
                    if (-not $colorSeq) {
                        if ($isContainer) {
                            $colorSeq = $colors.Types.$type[$name]
                        } elseif ($colors.Types.$type.ContainsKey($extension)) {
                            $colorSeq = $colors.Types.$type[$extension]
                        } else {
                            # File probably has multiple extensions
                            # Fallback to computing the full extension
                            $firstDot = $name.IndexOf('.')
                            if ($firstDot -ne -1) {
                                $fullExtension = $name.Substring($firstDot)
                                $colorSeq = $colors.Types.$type[$fullExtension]
                            }
                        }
                        if (-not $colorSeq) {
                            $colorSeq = $colors.Types.$type['']
                        }

                        # Final fallback: use hardcoded default colors
                        if (-not $colorSeq) {
                            if ($isContainer) {
                                # Default directory color: steel blue
                                $colorSeq = "${script:escape}[38;2;70;130;180m"
                            } else {
                                # Default file color: light gray
                                $colorSeq = "${script:escape}[38;2;211;211;211m"
                            }
                        }
                    }
                } else {
                    # No theme colors available: use default colors
                    if ($isContainer) {
                        $colorSeq = "${script:escape}[38;2;70;130;180m"
                    } else {
                        $colorSeq = "${script:escape}[38;2;211;211;211m"
                    }
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
