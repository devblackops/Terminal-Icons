function Format-TerminalIconsFileLength {
    <#
    .SYNOPSIS
        Format a file length according to the user's preferences.
    .DESCRIPTION
        Format a file length according to the user's preferences.
    .PARAMETER FileInfo
        The file to format.
    .EXAMPLE
        Format-TerminalIconsFileLength -FileInfo (Get-Item my_file.txt)
    .INPUTS
        System.IO.FileSystemInfo
    .OUTPUTS
        System.String
    #>
    [OutputType([String])]
    [CmdletBinding()]
    param(
        [IO.FileSystemInfo]$FileInfo,

        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:current
    )

    if (-not $FileInfo.PSIsContainer) {
        if ($CurrentSettings.FileSizeDisplay -eq [FileSizeDisplay]::KB_MB_GB) {
            "{0:N2} {1}" -f $(
                if ($FileInfo.Length -lt 1kb) { $FileInfo.length, 'B' }
                elseif ($FileInfo.length -lt 1mb) { ($FileInfo.length/1kb), 'KB' }
                elseif ($FileInfo.length -lt 1gb) { ($FileInfo.length/1mb), 'MB' }
                elseif ($FileInfo.length -lt 1tb) { ($FileInfo.length/1gb), 'GB' }
                else { ($FileInfo.length/1tb), 'TB' }
            )
        } else {
            $FileInfo.Length
        }
    }
}
