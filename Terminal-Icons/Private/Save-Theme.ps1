function Save-Theme {
    [cmdletbinding()]
    param(
        [parameter(mandatory, ValueFromPipeline)]
        [hashtable]$Theme
    )

    $themePath = Get-ThemeStoragePath
    $themeData | Export-CliXml -Path $themePath -Force
}
