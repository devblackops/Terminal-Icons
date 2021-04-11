function ConvertFrom-RGBColor {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$RGB
    )

    process {
        $RGB = $RGB.Replace('#', '')
        $r   = [convert]::ToInt32($RGB.SubString(0,2), 16)
        $g   = [convert]::ToInt32($RGB.SubString(2,2), 16)
        $b   = [convert]::ToInt32($RGB.SubString(4,2), 16)

        "${script:escape}[38;2;$r;$g;$b`m"
    }
}
