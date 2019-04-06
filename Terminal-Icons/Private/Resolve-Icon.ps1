function Resolve-Icon {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    # Attempt to resolve display info based on well known file names
    $displayInfo = Resolve-WellKnownNames $FileInfo

    if (-not $displayInfo) {

        # Default directory icon/color
        if ($FileInfo.PSIsContainer) {
            $displayInfo = @{
                Icon = $icons.folder
                Color = $colors.Grey
            }
        } else {
            # Attemp to resolve display info based on file extension
            $ext         = $FileInfo.Extension.TrimStart('.')
            $displayInfo = $mappings[$ext]
            if (-not $displayInfo) {
                $displayInfo = @{
                    Icon = $icons.generic_file
                    Color = $color.Reset
                }
            }
        }
    }

    $displayInfo
}
