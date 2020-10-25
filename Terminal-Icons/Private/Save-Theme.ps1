function Save-Theme {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [hashtable]$Theme
    )

    process {
        $themePath = Get-ThemeStoragePath
        $Theme | Export-CliXml -Path $themePath -Force
    }
}
