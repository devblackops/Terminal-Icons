@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    BuildHelpers = @{
        Version = '2.0.15'
    }
    Pester = @{
        Parameters = @{
            MinimumVersion = '5.1.1'
            SkipPublisherCheck = $true
        }
    }
    platyPS = '0.14.0'
    PowerShellBuild = @{
        RequiredVersion = '0.5.0-beta1'
        Parameters = @{
            AllowPrerelease = $true
        }
    }
    psake = '4.9.0'
    PSScriptAnalyzer = '1.19.1'
}
