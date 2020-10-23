function Save-Theme {
    [cmdletbinding()]
    param(
        [parameter(mandatory, ValueFromPipeline)]
        [hashtable]$Theme
    )

    process {
        $themePath = Get-ThemeStoragePath
        $Theme | Export-CliXml -Path $themePath -Force
    }
}
