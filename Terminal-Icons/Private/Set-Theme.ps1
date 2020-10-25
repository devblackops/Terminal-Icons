function Set-Theme {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Name,

        [ValidateSet('Color', 'Icon')]
        [Parameter(Mandatory)]
        [string]$Type
    )

    if (-not $themeData.Themes.$Type.ContainsKey($Name)) {
        Write-Error "$Type theme [$Name] not found."
    } else {
        $themeData."Current$($Type)Theme" = $Name
        Save-Theme -Theme $themeData
    }
}
