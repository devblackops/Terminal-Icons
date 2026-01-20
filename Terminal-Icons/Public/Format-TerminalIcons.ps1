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

        You can pipe objects that derive from System.IO.FileSystemInfo (System.IO.DirectoryInfo and System.IO.FileInfo) to 'Format-TerminalIcons'.
        Also supports deserialized FileSystemInfo objects from PowerShell remoting sessions.
    .OUTPUTS
        System.String

        Outputs a colorized string with an icon prepended.
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([string])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateScript({
            # Accept both local FileSystemInfo objects and deserialized objects from remoting
            if ($_ -is [IO.FileSystemInfo]) {
                return $true
            }
            # Check TypeNames array for deserialized objects
            $matches = $_.PSObject.TypeNames -match '^Deserialized\.System\.IO\.(DirectoryInfo|FileInfo)$'
            return ($null -ne $matches -and $matches.Count -gt 0)
        })]
        [PSObject]$FileInfo
    )

    process {
        $displayInfo = Resolve-Icon $FileInfo
        if ($displayInfo.Icon) {
            "$($displayInfo.Color)$($displayInfo.Icon)  $($FileInfo.Name)$($displayInfo.Target)$($script:colorReset)"
        } else {
            "$($displayInfo.Color)$($FileInfo.Name)$($displayInfo.Target)$($script:colorReset)"
        }
    }
}
