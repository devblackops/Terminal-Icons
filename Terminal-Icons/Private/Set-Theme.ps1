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
        $script:userThemeData."Current$($Type)Theme" = $null
        $script:prefs."Current$($Type)Theme" = ''
        Save-Preferences $script:prefs
    } else {
        if (-not $script:userThemeData.Themes.$Type.ContainsKey($Name)) {
            Write-Error "$Type theme [$Name] not found."
        } else {
            $script:userThemeData."Current$($Type)Theme" = $Name
            $script:prefs."Current$($Type)Theme" = $Name
            Save-Theme -Theme $userThemeData.Themes.$Type[$Name] -Type $type
            Save-Preferences $script:prefs
        }
    }
}
