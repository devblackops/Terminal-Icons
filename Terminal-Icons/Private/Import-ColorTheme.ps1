function Import-ColorTheme {
    [cmdletbinding()]
    param()

    $hash = @{}
    (Get-ChildItem -Path $moduleRoot/Data/colorThemes).ForEach({
        $colorData = ConvertFrom-Psd1 $_.FullName
        $hash[$colorData.Name] = $colorData
        $hash[$colorData.Name].Types.Directories[''] = $colorReset
        $hash[$colorData.Name].Types.Files['']       = $colorReset
    })
    $hash
}
