function Import-ColorTheme {
    [OutputType([hashtable])]
    [cmdletbinding()]
    param()

    $hash = @{}
    (Get-ChildItem -Path $moduleRoot/Data/colorThemes).ForEach({
        $colorData = Import-PowerShellDataFile $_.FullName
        $hash[$colorData.Name] = $colorData
        $hash[$colorData.Name].Types.Directories[''] = $colorReset
        $hash[$colorData.Name].Types.Files['']       = $colorReset
    })
    $hash
}
