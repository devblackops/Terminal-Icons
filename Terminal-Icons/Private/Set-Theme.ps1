function Set-Theme {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Name,

        [ValidateSet('Color', 'Icon')]
        [Parameter(Mandatory)]
        [string]$Type
    )

    if ([string]::IsNullOrEmpty($Name)) {
        $script:current."$($Type)Theme" = $null
        $script:prefs."$($Type)Theme" = ''
        Save-Preferences $script:prefs
    } else {
        if (-not $script:current.Themes.$Type.ContainsKey($Name)) {
            Write-Error "$Type theme [$Name] not found."
        } else {
            $script:current."$($Type)Theme" = $Name
            $script:prefs."$($Type)Theme" = $Name
            Save-Theme -Theme $script:current.Themes.$Type[$Name] -Type $type
            Save-Preferences $script:prefs
        }
    }
}
