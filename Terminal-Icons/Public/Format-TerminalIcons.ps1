
function Format-TerminalIcons {
    <#
    .SYNOPSIS
        When displaying in a terminal, prepend a custom icon (with color) to the provided file or folder object.
    .DESCRIPTION
        Take the provided file or folder object and look up the appropriate icon and color to display.
    .PARAMETER FileInfo
        The file or folder to display
    .EXAMPLE
        Get-ChildItem
    .EXAMPLE
        Get-Item ./README.md | Format-TerminalIcons
    #>
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    $colorReset = "`e[0m"
    $displayInfo = Resolve-Icon $FileInfo
    "$($displayInfo.Color)$($displayInfo.Icon)  $($FileInfo.Name)$colorReset"
}
