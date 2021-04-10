function Convert-ColorSequence {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [hashtable]$ColorData
    )

    $cs      = New-EmptyColorTheme
    $cs.Name = $ColorData.Name

    # Directories
    $cs.Types.Directories['symlink']  = ConvertFrom-RGBColor -RGB $ColorData.Types.Directories['symlink']
    $cs.Types.Directories['junction'] = ConvertFrom-RGBColor -RGB $ColorData.Types.Directories['junction']
    $ColorData.Types.Directories.WellKnown.GetEnumerator().ForEach({
        $cs.Types.Directories[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })

    # Wellknown files
    $cs.Types.Files['symlink']  = ConvertFrom-RGBColor -RGB $ColorData.Types.Files['symlink']
    $cs.Types.Files['junction'] = ConvertFrom-RGBColor -RGB $ColorData.Types.Files['junction']
    $ColorData.Types.Files.WellKnown.GetEnumerator().ForEach({
        $cs.Types.Files.WellKnown[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })

    # File extensions
    $ColorData.Types.Files.GetEnumerator().Where({$_.Name -ne 'WellKnown'}).ForEach({
        $cs.Types.Files[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })

    $cs
}
