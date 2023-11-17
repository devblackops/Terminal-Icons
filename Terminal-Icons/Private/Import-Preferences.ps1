function Import-Preferences {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [OutputType([Preferences])]
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline)]
        [string]$Path = (Get-PreferencesFile)
    )

    begin {
        $defaultPrefs = [Preferences]::new()
    }

    process {
        if (Test-Path $Path) {
            try {
                $prefs = Import-Clixml -Path $Path -ErrorAction Stop
                if (-not $prefs -is [Preferences]) {
                    # Preferences are in old format. Convert to new format.
                    $newPrefs = [Preferences]::new()
                    $newPrefs.ColorTheme = $prefs.CurrentColorTheme
                    $newPrefs.IconTheme  = $prefs.CurrentIconTheme
                    $newPrefs
                } else {
                    $prefs
                }
            } catch {
                Write-Warning "Unable to parse [$Path]. Setting default preferences."
                $defaultPrefs
            }
        } else {
            $defaultPrefs
        }
    }
}
