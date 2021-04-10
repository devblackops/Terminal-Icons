function New-EmptyColorTheme {
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
