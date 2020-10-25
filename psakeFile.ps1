properties {
    $PSBPreference.Build.CompileModule = $false
    $PSBPreference.Test.OutputFile     = "$($PSBPreference.Build.OutDir)/testResults.xml"
    $PSBPreference.Help.DefaultLocale  = 'en-US'
}

task default -depends Test

task Pester -FromModule PowerShellBuild -Version '0.4.0' -preaction {$script:modPath = $PSBPreference.General.ModuleManifestPath; Import-Module $script:modPath}

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

task TestGHAction -depends InstallAct {
    act -j test -P ubuntu-latest=nektos/act-environments-ubuntu:18.04
}
