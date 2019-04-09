function Resolve-WellKnownNames {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    if ($FileInfo.PSIsContainer) {
        $icon  = $currentTheme.icon.types.directories.wellKnown[$FileInfo.Name]
        $color = $currentTheme.color.types.directories.wellKnown[$FileInfo.Name]
    } else {
        $icon  = $currentTheme.icon.types.files.wellKnown[$FileInfo.Name]
        $color = $currentTheme.color.types.files.wellKnown[$FileInfo.Name]
    }

    @{
        icon = $icon
        color = $color
    }
}
