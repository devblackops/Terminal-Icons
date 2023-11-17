function Format-TerminalIcons {
    <#
    .SYNOPSIS
        Prepend a custom icon (with color) to the provided file or folder object when displayed.
    .DESCRIPTION
        Take the provided file or folder object and look up the appropriate icon and color to display.
    .PARAMETER FileInfo
        The file or folder to display
    .EXAMPLE
        Get-ChildItem

        List a directory. Terminal-Icons will be invoked automatically for display.
    .EXAMPLE
        Get-Item ./README.md | Format-TerminalIcons

        Get a file object and pass directly to Format-TerminalIcons.
    .INPUTS
        System.IO.FileSystemInfo

        You can pipe an objects that derive from System.IO.FileSystemInfo (System.IO.DIrectoryInfo and System.IO.FileInfo) to 'Format-TerminalIcons'.
    .OUTPUTS
        System.String

        Outputs a colorized string with an icon prepended.
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [OutputType([string])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [IO.FileSystemInfo]$FileInfo,

        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:current
    )

    begin {
        # Load the theme files on first invocation
        if (-not $script:themeFilesLoaded) {
            Import-XmlThemes
            $script:themeFilesLoaded = $true
        }
    }

    process {
        $displayInfo = Resolve-Icon $FileInfo
        if ($displayInfo.Icon) {
            "$($displayInfo.Color)$($displayInfo.Icon)  $($CurrentSettings.RendorModeUnicode)$($FileInfo.Name)$($displayInfo.Target)$($script:colorReset)"
        } else {
            "$($displayInfo.Color)$($CurrentSettings.RendorModeUnicode)$($FileInfo.Name)$($displayInfo.Target)$($script:colorReset)"
        }
    }
}
