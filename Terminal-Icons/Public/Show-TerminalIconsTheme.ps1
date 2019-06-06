function Show-TerminalIconsTheme {
    [cmdletbinding()]
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
    #Get-ChildItem -Path $examples | Format-Table
}
