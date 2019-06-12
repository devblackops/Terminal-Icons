function ConvertFrom-Psd1 {
    [cmdletBinding()]
    param (
        [parameter(Mandatory, ValueFromPipeline)]
        [Microsoft.PowerShell.DesiredStateConfiguration.ArgumentToConfigurationDataTransformation()]
        [hashtable]$Data
    )

    return $Data
}
