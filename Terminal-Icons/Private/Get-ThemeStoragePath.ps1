function Get-ThemeStoragePath {
    [CmdletBinding()]
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
        $storagePath = [IO.Path]::Combine($path, 'powershell', 'Community', 'Terminal-Icons')
        if (-not (Test-Path $storagePath)) {
            New-Item -Path $storagePath -ItemType Directory -Force
        }
    }
    $storagePath
}
