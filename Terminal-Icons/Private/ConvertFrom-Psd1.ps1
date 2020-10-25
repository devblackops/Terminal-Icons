function ConvertFrom-Psd1 {
    [OutputType([hashtable])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [Microsoft.PowerShell.DesiredStateConfiguration.ArgumentToConfigurationDataTransformation()]
        [hashtable]$Data
    )

    process {
        return $Data
    }
}
