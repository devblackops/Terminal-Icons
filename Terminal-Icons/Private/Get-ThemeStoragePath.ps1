function Get-ThemeStoragePath {
    [OutputType([string])]
    [CmdletBinding()]
    param()

    if ($IsLinux -or $IsMacOs) {
        if (-not ($basePath = $env:XDG_CONFIG_HOME)) {
            $basePath = [IO.Path]::Combine($HOME, '.local', 'share')
        }
    } else {
        if (-not ($basePath = $env:APPDATA)) {
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
