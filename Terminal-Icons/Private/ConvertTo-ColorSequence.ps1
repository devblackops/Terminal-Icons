function ConvertTo-ColorSequence {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [hashtable]$ColorData
    )

    process {
        $cs      = New-EmptyColorTheme
        $cs.Name = $ColorData.Name

        # Directories
        if ($ColorData.Types.Directories['symlink']) {
            $cs.Types.Directories['symlink']  = ConvertFrom-RGBColor -RGB $ColorData.Types.Directories['symlink']
        }
        if ($ColorData.Types.Directories['junction']) {
            $cs.Types.Directories['junction'] = ConvertFrom-RGBColor -RGB $ColorData.Types.Directories['junction']
        }
        # Process WellKnown directory names
        $ColorData.Types.Directories.WellKnown.GetEnumerator().ForEach({
            $cs.Types.Directories[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
        })
        # Process default directory color if present
        if ($ColorData.Types.Directories.ContainsKey('') -and $ColorData.Types.Directories['']) {
            $defaultColor = $ColorData.Types.Directories['']
            if ($defaultColor -is [string] -and $defaultColor -match '^[0-9A-Fa-f]{6}$') {
                $cs.Types.Directories[''] = ConvertFrom-RGBColor -RGB $defaultColor
            }
        }

        # Wellknown files
        if ($ColorData.Types.Files['symlink']) {
            $cs.Types.Files['symlink']  = ConvertFrom-RGBColor -RGB $ColorData.Types.Files['symlink']
        }
        if ($ColorData.Types.Files['junction']) {
            $cs.Types.Files['junction'] = ConvertFrom-RGBColor -RGB $ColorData.Types.Files['junction']
        }
        $ColorData.Types.Files.WellKnown.GetEnumerator().ForEach({
            $cs.Types.Files.WellKnown[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
        })

        # File extensions
        $ColorData.Types.Files.GetEnumerator().Where({$_.Name -ne 'WellKnown' -and $_.Name -ne ''}).ForEach({
            $cs.Types.Files[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
        })
        # Process default file color if present
        if ($ColorData.Types.Files.ContainsKey('') -and $ColorData.Types.Files['']) {
            $defaultColor = $ColorData.Types.Files['']
            if ($defaultColor -is [string] -and $defaultColor -match '^[0-9A-Fa-f]{6}$') {
                $cs.Types.Files[''] = ConvertFrom-RGBColor -RGB $defaultColor
            }
        }

        $cs
    }
}
