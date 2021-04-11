@{
    Name  = 'MyAwesomeTheme'
    Types = @{
        Directories = @{
            ''        = 'nf-fa-file'
            symlink   = 'nf-oct-file_symlink_directory'
            junction  = 'nf-fa-external_link'
            WellKnown = @{
                tests = 'nf-fa-gear'
            }
        }
        Files       = @{
            ''        = 'nf-fa-file'
            symlink   = 'nf-oct-file_symlink_file'
            junction  = 'nf-fa-external_link'
            WellKnown = @{
                '.ps1' = 'nf-fa-gear'
            }
        }
    }
}
