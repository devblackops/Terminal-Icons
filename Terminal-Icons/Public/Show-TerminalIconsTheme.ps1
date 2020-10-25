function Show-TerminalIconsTheme {
    <#
    .SYNOPSIS
        List example directories and files to show the currently applied color and icon themes.
    .DESCRIPTION
        List example directories and files to show the currently applied color and icon themes.
        The directory/file objects show are in memory only, they are not written to the filesystem.
    .EXAMPLE
        Show-TerminalIconsTheme

        List example directories and files to show the currently applied color and icon themes.
    .INPUTS
        None.
    .OUTPUTS
        System.IO.DirectoryInfo
    .OUTPUTS
        System.IO.FileInfo
    .NOTES
        Example directory and file objects only exist in memory. They are not written to the filesystem.
    .LINK
        Get-TerminalIconsColorTheme
    .LINK
        Get-TerminalIconsIconTheme
    .LINK
        Get-TerminalIconsTheme
    #>
    [CmdletBinding()]
    param()

    $directories = @(
        [IO.DirectoryInfo]::new('ExampleFolder')
        $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Directories.WellKnown.Keys.ForEach({
            [IO.DirectoryInfo]::new($_)
        })
    )
    $wellKnownFiles = @(
        [IO.FileInfo]::new('ExampleFile')
        $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Files.WellKnown.Keys.ForEach({
            [IO.FileInfo]::new($_)
        })
    )

    $extensions = $themeData.Themes.Icon[$themeData.CurrentIconTheme].Types.Files.Keys.Where({$_ -ne 'WellKnown'}).ForEach({
        [IO.FileInfo]::new("example$_")
    })

    $directories + $wellKnownFiles + $extensions | Sort-Object
}
