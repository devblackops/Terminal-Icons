# Based on Jayku's color theme
# https://github.com/Jaykul/Profile/blob/master/Configuration.psd1

@{
    Name  = 'jaykul'
    Types = @{
        Directories = @{
            # Default directory icon
            ''        = 'nf-fa-folder'

            WellKnown = @{
                docs   = 'nf-fa-folder'
                images = ''
            }
        }

        Files       = @{

            WellKnown         = @{
                '.gitattributes' = 'nf-mdi-git'
                '.gitignore'     = 'nf-mdi-git'
                'LICENSE'        = 'nf-mdi-certificate'
                'CHANGELOG.md'   = 'nf-fae-checklist_o'
                'README.md'      = 'nf-mdi-library_books'
                '.DS_Store'      = 'nf-fa-file_o'
                'Dockerfile'     = 'nf-dev-docker'
            }

            ''                = 'nf-fa-file'

            # Archive files
            '.7z'             = 'nf-fa-archive'
            '.bz'             = 'nf-fa-archive'
            '.tar'            = 'nf-fa-archive'
            '.zip'            = 'nf-oct-file_zip'

            # Executable things
            '.bat'            = 'nf-custom-msdos'
            '.cmd'            = 'nf-custom-msdos'
            '.exe'            = 'nf-mdi-application'
            '.js'             = 'nf-mdi-language_javascript'
            '.pl'             = 'nf-dev-perl'
            '.ps1'            = 'nf-dev-terminal_badge'
            '.rb'             = 'nf-oct-ruby'
            '.sh'             = 'nf-oct-terminal'

            # Not-executable code files
            '.dll'            = 'nf-fa-archive'
            '.pdb'            = 'nf-fa-archive'
            '.psm1'           = 'nf-fa-archive'

            # Importable Data files
            '.clixml'         = 'nf-dev-code_badge'
            '.csv'            = 'nf-mdi-table_large'
            '.json'           = 'nf-seti-json'
            '.ps1xml'         = 'nf-mdi-file_xml'
            '.psd1'           = 'nf-mdi-code_braces'
            '.yml'            = 'nf-mdi-format_align_left'
            '.xml'            = 'nf-mdi-xm'

            # Config files
            '.conf'           = 'nf-mdi-settings_box'
            '.config'         = 'nf-mdi-settings_box'
            '.reg'            = 'nf-mdi-settings_box'
            '.vscode'         = 'nf-custom-folder_config'

            # Source Files
            '.c'              = 'nf-mdi-language_c'
            '.cpp'            = 'nf-mdi-language_cpp'
            '.cs'             = 'nf-mdi-language_csharp'
            '.fs'             = 'nf-dev-fsharp'
            '.go'             = 'nf-dev-go'
            '.php'            = 'nf-dev-php'

            # Source Control
            '.git'            = 'nf-dev-git'
            '.gitignore'      = 'nf-dev-git'
            '.gitattribute'   = 'nf-dev-git'

            # Project files
            '.csproj'         = 'nf-mdi-visualstudio'
            '.sln'            = 'nf-mdi-visualstudio'
            '.user'           = 'nf-mdi-visualstudio'
            '.code-workspace' = 'nf-mdi-visualstudio'

            # Text data files
            '.log'            = 'nf-mdi-file_document'
            '.txt'            = 'nf-mdi-file_document'

            # Documents
            '.chm'            = 'nf-mdi-help_box'
            '.doc'            = 'nf-mdi-file_word'
            '.docx'           = 'nf-mdi-file_word'
            '.htm'            = 'nf-seti-html'
            '.html'           = 'nf-seti-html'
            '.pdf'            = 'nf-mdi-file_pdf'
            '.md'             = 'nf-dev-markdown'
            '.xls'            = 'nf-mdi-file_exce'
            '.xlsx'           = 'nf-mdi-file_exce'

            # Images
            '.png'            = 'nf-fa-file_image_o'
            '.jpg'            = 'nf-fa-image'
            '.jpeg'           = 'nf-fa-image'
            '.gif'            = 'nf-mdi-image'
        }
    }
}
