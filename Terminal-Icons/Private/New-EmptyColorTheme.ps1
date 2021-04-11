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
