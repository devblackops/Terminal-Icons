properties {
    # Build settings
    $PSBPreference.Build.CompileModule   = $true
    $PSBPreference.Build.CopyDirectories = @('Data')
    $PSBPreference.Build.CompileHeader   = @'
using namespace System.Management.Automation
using namespace System.Collections.ObjectModel
'@

    # Test settings
    $PSBPreference.Test.ImportModule                =   $true
    $PSBPreference.Test.OutputFile                  = [IO.Path]::Combine($PSBPreference.Build.OutDir, 'testResults.xml')
    $PSBPreference.Test.ScriptAnalysis.SettingsPath = [IO.Path]::Combine($PSBPreference.Test.RootDir, 'ScriptAnalyzerSettings.psd1')

    # Publish settings
    if ($galleryApiKey) {
        $PSBPreference.Publish.PSRepositoryApiKey = $galleryApiKey.GetNetworkCredential().password
    }
}

task default -depends Test

task Pester -FromModule PowerShellBuild -Version '0.6.1' -preaction {Remove-Module Terminal-Icons -ErrorAction SilentlyContinue}

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
