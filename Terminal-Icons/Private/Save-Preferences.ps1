function Save-Preferences {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [Preferences]$Preferences,

        [string]$Path = (Get-PreferencesFile)
    )

    process {
        Write-Debug ('Saving preferendces to [{0}]' -f $Path)
        $Preferences | Export-CliXml -Path $Path -Force
    }
}
