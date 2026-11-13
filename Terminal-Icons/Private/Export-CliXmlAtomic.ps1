function Export-CliXmlAtomic {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [object]$InputObject,

        [parameter(Mandatory)]
        [string]$Path
    )

    process {
        # Write to a temp file in the same directory and then rename it into place so
        # other PowerShell sessions starting at the same time never read a partial file.
        $tempPath = '{0}.{1}.tmp' -f $Path, [guid]::NewGuid().ToString('N')
        try {
            $InputObject | Export-CliXml -Path $tempPath -Force -ErrorAction Stop
            if ($PSVersionTable.PSEdition -eq 'Core') {
                [IO.File]::Move($tempPath, $Path, $true)
            } elseif (Test-Path -LiteralPath $Path) {
                [IO.File]::Replace($tempPath, $Path, [NullString]::Value)
            } else {
                [IO.File]::Move($tempPath, $Path)
            }
        } catch {
            # Another session most likely won the race and wrote the same data
            Write-Debug ('Unable to save [{0}]: {1}' -f $Path, $_)
        } finally {
            if (Test-Path -LiteralPath $tempPath) {
                Remove-Item -LiteralPath $tempPath -Force -ErrorAction SilentlyContinue
            }
        }
    }
}
