function Import-IconTheme {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [IO.FileInfo[]]$Path,

        [hashtable]$IconThemes = $script:iconThemes
    )

    process {
        foreach ($p in $Path) {
            $IconThemes.Add($p.Basename, (Import-PowerShellDataFile -Path $p.FullName))
        }
    }
}
