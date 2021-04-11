function Import-Preferences {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline)]
        [string]$Path = (Join-Path (Get-ThemeStoragePath) 'prefs.xml'),

        [string]$DefaultThemeName = $script:defaultTheme
    )

    if (Test-Path $Path) {
        Import-Clixml -Path $Path
    } else {
        @{
            CurrentColorTheme = $DefaultThemeName
            CurrentIconTheme  = $DefaultThemeName
        }
    }
}
