function Get-ThemeStoragePath {
    [OutputType([string])]
    [CmdletBinding()]
    param()

    if ($IsLinux -or $IsMacOs) {
        $basePath = $env:XDG_CONFIG_HOME
        if (-not $basePath) {
            $basePath = [IO.Path]::Combine($HOME, '.local', 'share')
        }
    } else {
        $basePath = $env:APPDATA
        if (-not $basePath) {
            $basePath = [Environment]::GetFolderPath('ApplicationData')
        }
    }

    if ($basePath) {
        $storagePath = [IO.Path]::Combine($basePath, 'powershell', 'Community', 'Terminal-Icons')
        if (-not (Test-Path $storagePath)) {
            New-Item -Path $storagePath -ItemType Directory -Force > $null
        }
        $storagePath
    }
}
