function Save-Preferences {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [hashtable]$Preferences,

        [string]$Path = (Join-Path (Get-ThemeStoragePath) 'prefs.xml')
    )

    process {
        Write-Debug ('Saving preferendces to [{0}]' -f $Path)
        $Preferences | Export-CliXml -Path $Path -Force
    }
}
