function Import-IconTheme {
    [OutputType([hashtable])]
    [cmdletbinding()]
    param()

    $hash = @{}
    (Get-ChildItem -Path $moduleRoot/Data/iconThemes).ForEach({
        $hash.Add($_.Basename, (Import-PowerShellDataFile $_.FullName))
    })
    $hash
}
