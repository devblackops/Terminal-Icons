@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    BuildHelpers = @{
        Version = '2.0.0'
    }
    Configuration = '1.3.1'
    Pester = @{
        Version = '4.4.1'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    platyPS = '0.14.0'
    PowerShellBuild = '0.3.0'
    psake = '4.8.0'
    PSScriptAnalyzer = '1.18.0'
}
