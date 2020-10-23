function ConvertFrom-Psd1 {
    [OutputType([System.Collections.Hashtable])]
    [cmdletBinding()]
    param (
        [parameter(Mandatory, ValueFromPipeline)]
        [Microsoft.PowerShell.DesiredStateConfiguration.ArgumentToConfigurationDataTransformation()]
        [hashtable]$Data
    )

    process {
        return $Data
    }
}
