function Save-Theme {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [hashtable]$Theme,

        [ValidateSet('color', 'icon')]
        [string]$Type,

        [string]$Path = (Get-ThemeStoragePath)
    )

    process {
        $themePath = Join-Path $Path "$($Theme.Name)_$($Type.ToLower()).xml"
        Write-Debug ('Saving [{0}] theme [{1}] to [{2}]' -f $type, $theme.Name, $themePath)
        $Theme | Export-CliXml -Path $themePath -Force
    }
}
