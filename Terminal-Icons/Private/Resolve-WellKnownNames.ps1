function Resolve-WellKnownNames {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    if ($FileInfo.PSIsContainer) {
        # TODO
        # Need some good folder icons to work with
        switch ($FileInfo.Name) {
            '.github' { @{Icon = $icons.folder_github; Color = $color.Blue}; break }
            '.vscode' { @{Icon = $icons.folder_vscode; Color = $color.Green}; break }
            #default   { @{Icon = [char][int]'0xf74a'; Color = $color.LightGrey}}
        }
    } else {
        switch ($FileInfo.Name) {
            '.gitattributes' { @{Icon = $icons.gitattributes; Color = $color.LightBlue}; break }
            '.gitignore'     { @{Icon = $icons.gitignore; Color = $color.LightBlue}; break }
            'LICENSE'        { @{Icon = $icons.license; Color = $color.Yellow}; break }
            'README.md'      { @{Icon = $icons.readme; Color = $color.Yellow}; break }
            '.DS_Store'      { @{Icon = $icons.ds_store; Color = $color.Yellow}; break}
            #default          { @{Icon = [char][int]' '; Color = $color.Reset}}
        }
    }
}
