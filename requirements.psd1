@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    BuildHelpers = @{
        Version = '2.0.15'
    }
    Pester = @{
        Version = '4.10.0'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    platyPS = '0.14.0'
    PowerShellBuild = '0.4.0'
    psake = '4.9.0'
    PSScriptAnalyzer = '1.19.1'
}
