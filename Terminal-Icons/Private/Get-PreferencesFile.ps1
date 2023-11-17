function Get-PreferencesFile {
    [OutputType([String])]
    param(
        [string]$Filename = $script:prefsFile
    )

    [IO.Path]::Combine((Get-ThemeStoragePath), $Filename)
}
