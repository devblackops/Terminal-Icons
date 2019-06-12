# Taken with love from https://github.com/PowerShell/DscResource.Tests/blob/master/MetaFixers.psm1

<#
    This module helps fix problems, found by Meta.Tests.ps1
#>

$ErrorActionPreference = 'stop'
Set-StrictMode -Version latest

function ConvertTo-UTF8() {
    [CmdletBinding()]
    [OutputType([void])]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.IO.FileInfo]$FileInfo
    )

    process {
        $content = Get-Content -Raw -Encoding Unicode -Path $FileInfo.FullName
        [System.IO.File]::WriteAllText($FileInfo.FullName, $content, [System.Text.Encoding]::UTF8)
    }
}

function ConvertTo-SpaceIndentation() {
    [CmdletBinding()]
    [OutputType([void])]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.IO.FileInfo]$FileInfo
    )

    process {
        $content = (Get-Content -Raw -Path $FileInfo.FullName) -replace "`t", '    '
        [System.IO.File]::WriteAllText($FileInfo.FullName, $content)
    }
}

function Get-TextFilesList {
    [CmdletBinding()]
    [OutputType([System.IO.FileInfo])]
    param(
        [Parameter(Mandatory)]
        [string]$Root
    )
    Get-ChildItem -Path $Root -File -Recurse |
        Where-Object { @('.gitignore', '.gitattributes', '.ps1', '.psm1', '.psd1', '.json', '.xml', '.cmd', '.mof') -contains $_.Extension }
}

function Test-FileUnicode {
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.IO.FileInfo]$FileInfo
    )

    process {
        $path = $FileInfo.FullName
        $bytes = [System.IO.File]::ReadAllBytes($path)
        $zeroBytes = @($bytes -eq 0)
        return [bool]$zeroBytes.Length

    }
}

function Get-UnicodeFilesList() {
    [CmdletBinding()]
    [OutputType([System.IO.FileInfo])]
    param(
        [Parameter(Mandatory)]
        [string]$Root
    )

    Get-TextFilesList $Root | Where-Object { Test-FileUnicode $_ }
}
