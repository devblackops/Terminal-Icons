@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    'Pester' = @{
        Version = '4.4.1'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    'psake' = @{
        Version = '4.8.0'
    }
    'BuildHelpers' = @{
        Version = '2.0.0'
    }
    'PowerShellBuild' = @{
        Version = '0.2.0'
    }
}
