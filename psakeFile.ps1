properties {
    # Build settings
    $PSBPreference.Build.CompileModule   = $true
    $PSBPreference.Build.CopyDirectories = @('Data')
    $PSBPreference.Build.CompileHeader   = @'
using namespace System.Management.Automation
using namespace System.Collections.ObjectModel
'@

    # Test settings
    $PSBPreference.Test.ImportModule                = $true
    $PSBPreference.Test.OutputFile                  = [IO.Path]::Combine($PSBPreference.Build.OutDir, 'testResults.xml')
    $PSBPreference.Test.ScriptAnalysis.SettingsPath = [IO.Path]::Combine($PSBPreference.Test.RootDir, 'ScriptAnalyzerSettings.psd1')

    # Publish settings
    if ($galleryApiKey) {
        $PSBPreference.Publish.PSRepositoryApiKey = $galleryApiKey.GetNetworkCredential().password
    }
}

task default -depends Test

task BuildModule -preaction {Remove-Module Terminal-Icons -ErrorAction SilentlyContinue} -depends CompileTheme, Build {}

task Pester -FromModule PowerShellBuild -Version '0.6.1'

task CompileTheme {
    $escape     = [char]27
    $colorReset = "${escape}[0m"

    $iconThemes = @{}
    (Get-ChildItem -Path ./Terminal-Icons/Data/iconThemes).ForEach({
        $iconThemes.Add($_.Basename, (Import-PowerShellDataFile $_.FullName))
    })
    $iconThemes | Export-Clixml -Path ./Terminal-Icons/Data/iconThemes.xml

    $colorThemes = @{}
    (Get-ChildItem -Path ./Terminal-Icons/Data/colorThemes).ForEach({
        $colorData = Import-PowerShellDataFile $_.FullName
        $colorThemes[$colorData.Name] = $colorData
        $colorThemes[$colorData.Name].Types.Directories[''] = $colorReset
        $colorThemes[$colorData.Name].Types.Files['']       = $colorReset
    })
    $colorThemes | Export-Clixml -Path ./Terminal-Icons/Data/colorThemes.xml

    $colorSequences = @{}
    $colorThemes.GetEnumerator().ForEach({
        $colorSequences[$_.Name] = ConvertTo-ColorSequence -ColorData $_.Value
    })
    $colorSequences | Export-Clixml -Path ./Terminal-Icons/Data/colorSequences.xml

    $glyphs = . ./Terminal-Icons/Data/glyphs.ps1
    $glyphs | Export-Clixml -Path ./Terminal-Icons/Data/glyphs.xml
}

task UpdateGlyphs {
    Import-Module PowerHtml

    $cheatsheet = 'https://www.nerdfonts.com/cheat-sheet'
    $parsedHtml = Invoke-WebRequest $cheatsheet | ConvertFrom-Html
    $glyphs     = $parsedHtml.SelectNodes("//div[@class='class-name']").ForEach({
        [pscustomobject]@{
            name      = $_.InnerText
            codePoint = $_.NextSibling[0].InnerText
        }
    })

    $sb = [Text.StringBuilder]::new()
    $sb.AppendLine('@{') > $null
    $glyphs.ForEach({
        $icon = [char][int]"0x$($_.codePoint)"
        $sb.AppendFormat("    '{0}' = '{1}'`n", $_.Name, $icon ) > $null
    })
    $sb.AppendLine('}') > $null

    $now = [int][double]::Parse((Get-Date -UFormat %s))
    $fileName = "$PSScriptRoot/Terminal-Icons/Data/glyphs_$now.ps1"
    $sb.ToString().Trim() | Out-File $fileName -Encoding utf8

} -description 'Create a list of glyphs, sourced from nerdfonts.com'

task InstallAct {
    if (-not (Get-Command -Name act -CommandType Application -ErrorAction SilentlyContinue)) {
        if ($IsWindows) {
            choco install act-cli
        } elseif ($IsLinux) {
            curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
        } elseIf ($IsMacOS) {
            brew install nektos/tap/act
        }
    } else {
        'act already installed'
    }
}

task TestGHAction -depends Build, InstallAct  {
    act -j test -P ubuntu-latest=nektos/act-environments-ubuntu:18.04
}

task TestImportPerformance {
    (Measure-Command { pwsh -nop -c {Import-Module ./Output/Terminal-Icons/0.12.0/Terminal-Icons.psd1}}).TotalMilliseconds
        | Measure-Object -Average

    $trace = Trace-Script -ScriptBlock {Import-Module ./Output/Terminal-Icons/0.12.0/Terminal-Icons.psd1 -Force }
    $trace.AllLines | Format-Table
}

function New-EmptyColorTheme {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([hashtable])]
    [cmdletbinding()]
    param()

    @{
        Name = ''
        Types = @{
            Directories = @{
                #''        = "`e[0m"
                symlink  = ''
                junction = ''
                WellKnown = @{}
            }
            Files = @{
                #''        = "`e[0m"
                symlink  = ''
                junction = ''
                WellKnown = @{}
            }
        }
    }
}

function ConvertFrom-RGBColor {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$RGB
    )

    process {
        $escape = [char]27

        $RGB = $RGB.Replace('#', '')
        $r   = [convert]::ToInt32($RGB.SubString(0,2), 16)
        $g   = [convert]::ToInt32($RGB.SubString(2,2), 16)
        $b   = [convert]::ToInt32($RGB.SubString(4,2), 16)

        "$escape[38;2;$r;$g;$b`m"
    }
}

function ConvertTo-ColorSequence {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline)]
        [hashtable]$ColorData
    )

    process {
        $cs      = New-EmptyColorTheme
        $cs.Name = $ColorData.Name

        # Directories
        if ($ColorData.Types.Directories['symlink']) {
            $cs.Types.Directories['symlink']  = ConvertFrom-RGBColor -RGB $ColorData.Types.Directories['symlink']
        }
        if ($ColorData.Types.Directories['junction']) {
            $cs.Types.Directories['junction'] = ConvertFrom-RGBColor -RGB $ColorData.Types.Directories['junction']
        }
        $ColorData.Types.Directories.WellKnown.GetEnumerator().ForEach({
            $cs.Types.Directories[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
        })

        # Wellknown files
        if ($ColorData.Types.Files['symlink']) {
            $cs.Types.Files['symlink']  = ConvertFrom-RGBColor -RGB $ColorData.Types.Files['symlink']
        }
        if ($ColorData.Types.Files['junction']) {
            $cs.Types.Files['junction'] = ConvertFrom-RGBColor -RGB $ColorData.Types.Files['junction']
        }
        $ColorData.Types.Files.WellKnown.GetEnumerator().ForEach({
            $cs.Types.Files.WellKnown[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
        })

        # File extensions
        $ColorData.Types.Files.GetEnumerator().Where({$_.Name -ne 'WellKnown' -and $_.Name -ne ''}).ForEach({
            $cs.Types.Files[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
        })

        $cs
    }
}
