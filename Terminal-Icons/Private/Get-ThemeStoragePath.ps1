function Get-ThemeStoragePath {
    [OutputType([string])]
    [CmdletBinding()]
    param()

    if ($IsLinux -or $IsMacOs) {
        $path = @($env:XDG_CONFIG_DIRS -split ([IO.Path]::PathSeparator))[0]
        if (-not $path) {
            $path = [IO.Path]::Combine($HOME, '.local', 'share')
        }
    } else {
        $path = $env:APPDATA
        if (-not $path) {
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
