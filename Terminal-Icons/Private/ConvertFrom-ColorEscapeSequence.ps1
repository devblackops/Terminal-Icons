function ConvertFrom-ColorEscapeSequence {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Sequence
    )

    process {
        # Example input sequence: 'e[38;2;135;206;250m'
        $arr = $Sequence.Split(';')
        $r   = '{0:x}' -f [int]$arr[2]
        $g   = '{0:x}' -f [int]$arr[3]
        $b   = '{0:x}' -f [int]$arr[4].TrimEnd('m')

        ($r + $g + $b).ToUpper()
    }
}
