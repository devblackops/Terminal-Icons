function Import-Preferences {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([hashtable])]
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline)]
        [string]$Path = (Join-Path (Get-ThemeStoragePath) 'prefs.xml'),

        [string]$DefaultThemeName = $script:defaultTheme
    )

    process {
        if (Test-Path $Path) {
            Import-Clixml -Path $Path
        } else {
            @{
                CurrentColorTheme = $DefaultThemeName
                CurrentIconTheme  = $DefaultThemeName
            }
        }
    }
}
