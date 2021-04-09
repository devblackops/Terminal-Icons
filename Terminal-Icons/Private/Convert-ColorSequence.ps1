function Convert-ColorSequence {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [hashtable]$ColorData
    )

    # Import the color theme and convert to escape sequences
    # $colorData = ConvertFrom-Psd1 $ColorThemePath
    $colorSequences[$ColorData.Name] = @{
        Name = $ColorData.Name
        Types = @{
            Directories = @{
                #''        = "`e[0m"
                symlink  = ''
                junction = ''
                WellKnown = @{}
            }
            Files = @{
                #''        = "`e[0m"
                symlink  = ''
                junction = ''
                WellKnown = @{}
            }
        }
    }

    # Directories
    $colorSequences[$ColorData.Name].Types.Directories['symlink']  = ConvertFrom-RGBColor -RGB $ColorData.Types.Directories['symlink']
    $colorSequences[$ColorData.Name].Types.Directories['junction'] = ConvertFrom-RGBColor -RGB $ColorData.Types.Directories['junction']
    $ColorData.Types.Directories.WellKnown.GetEnumerator().ForEach({
        $colorSequences[$ColorData.Name].Types.Directories[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })

    # Wellknown files
    $colorSequences[$ColorData.Name].Types.Files['symlink']  = ConvertFrom-RGBColor -RGB $ColorData.Types.Files['symlink']
    $colorSequences[$ColorData.Name].Types.Files['junction'] = ConvertFrom-RGBColor -RGB $ColorData.Types.Files['junction']
    $ColorData.Types.Files.WellKnown.GetEnumerator().ForEach({
        $colorSequences[$ColorData.Name].Types.Files.WellKnown[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })

    # File extensions
    $ColorData.Types.Files.GetEnumerator().Where({$_.Name -ne 'WellKnown'}).ForEach({
        $colorSequences[$ColorData.Name].Types.Files[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
    })

    $colorSequences
}
