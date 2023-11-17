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
    param(
        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:current
    )

    $theme = Get-TerminalIconsTheme

    # Use the default theme if the icon theme has been disabled
    if ($theme.Icon) {
        $themeName = $theme.Icon.Name
    } else {
        $themeName = $script:defaultTheme
    }

    $directories = @(
        [IO.DirectoryInfo]::new('ExampleFolder')
        $CurrentSettings.Themes.Icon[$themeName].Types.Directories.WellKnown.Keys.ForEach({
            [IO.DirectoryInfo]::new($_)
        })
    )
    $wellKnownFiles = @(
        [IO.FileInfo]::new('ExampleFile')
        $CurrentSettings.Themes.Icon[$themeName].Types.Files.WellKnown.Keys.ForEach({
            [IO.FileInfo]::new($_)
        })
    )

    $extensions = $CurrentSettings.Themes.Icon[$themeName].Types.Files.Keys.Where({$_ -ne 'WellKnown'}).ForEach({
        [IO.FileInfo]::new("example$_")
    })

    $directories + $wellKnownFiles + $extensions | Sort-Object | Format-TerminalIcons
}
