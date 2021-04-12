@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    BuildHelpers = @{
        Version = '2.0.16'
    }
    Pester = @{
        Parameters = @{
            MinimumVersion = '5.1.1'
            SkipPublisherCheck = $true
        }
    }
    platyPS = '0.14.1'
    PowerHtml = 'latest'
    PowerShellBuild = @{
        RequiredVersion = '0.6.1'
    }
    psake = '4.9.0'
    PSScriptAnalyzer = '1.19.1'
}
