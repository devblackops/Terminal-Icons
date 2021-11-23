function Import-Preferences {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([hashtable])]
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline)]
        [string]$Path = (Join-Path (Get-ThemeStoragePath) 'prefs.xml'),

        [string]$DefaultThemeName = $script:defaultTheme
    )

    begin {
        $defaultPrefs = @{
            CurrentColorTheme = $DefaultThemeName
            CurrentIconTheme  = $DefaultThemeName
        }
    }

    process {
        if (Test-Path $Path) {
            try {
                Import-Clixml -Path $Path -ErrorAction Stop
            } catch {
                Write-Warning "Unable to parse [$Path]. Setting default preferences."
                $defaultPrefs
            }
        } else {
            $defaultPrefs
        }
    }
}
