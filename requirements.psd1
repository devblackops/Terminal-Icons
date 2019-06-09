@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    BuildHelpers = @{
        Version = '2.0.9'
    }
    Configuration = '1.3.1'
    Pester = @{
        Version = '4.8.1'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    platyPS = '0.14.0'
    PowerShellBuild = '0.3.1'
    psake = '4.8.0'
    PSScriptAnalyzer = '1.18.0'
}
