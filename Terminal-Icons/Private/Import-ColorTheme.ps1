function Import-ColorTheme {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [IO.FileInfo[]]$Path,

        [hashtable]$ColorThemes = $script:colorThemes,

        [hashtable]$ColorSequences = $script:colorSequences
    )

    process {
        foreach ($p in $Path) {
            $colorData = ConvertFrom-Psd1 $p.FullName
            $ColorSequences[$colorData.Name] = Convert-ColorSequence -ColorData $colorData

            $colorThemes[$colorData.Name] = $colorData
            $colorThemes[$colorData.Name].Types.Directories[''] = $colorReset
            $colorThemes[$colorData.Name].Types.Files['']       = $colorReset
        }
    }
}
