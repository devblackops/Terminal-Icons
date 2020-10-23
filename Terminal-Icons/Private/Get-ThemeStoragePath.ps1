function Get-ThemeStoragePath {
    [cmdletbinding()]
    param()

    if ($IsLinux -or $IsMacOs) {
        if (-not ($path = @($env:XDG_CONFIG_DIRS -split ([IO.Path]::PathSeparator))[0])) {
            $path = [IO.Path]::Combine($HOME, '.local', 'share')
        }
    } else {
        if (-not ($path = $env:APPDATA)) {
            $path = [Environment]::GetFolderPath('ApplicationData')
        }
    }

    if ($path) {
        [IO.Path]::Combine($path, 'powershell', 'Community', 'Terminal-Icons', 'theme.xml')
    }
}
