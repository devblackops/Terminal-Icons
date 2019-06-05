@{
    Name  = 'devblackops'
    Types = @{
        Directories = @{
            # Default directory icon
            ''        = 'nf-fa-folder'

            WellKnown = @{
                docs      = 'nf-fa-folder'
                images    = 'nf-mdi-folder_image'
                '.vscode' = 'nf-custom-folder_config'
            }
        }

        Files       = @{

            # Default file icon
            ''                      = 'nf-fa-file'

            WellKnown               = @{
                '.gitattributes' = 'nf-mdi-git'
                '.gitignore'     = 'nf-mdi-git'
                'LICENSE'        = 'nf-mdi-certificate'
                'CHANGELOG.md'   = 'nf-fae-checklist_o'
                'README.md'      = 'nf-mdi-library_books'
                '.DS_Store'      = 'nf-fa-file_o'
                'Dockerfile'     = 'nf-dev-docker'
                '.tsbuildinfo'   = 'nf-seti-json'
                '.jscsrc'        = 'nf-seti-json'
                '.jshintrc'      = 'nf-seti-json'
                'tsconfig.json'  = 'nf-seti-json'
                'tslint.json'    = 'nf-seti-json'
                'composer.lock'  = 'nf-seti-json'
                '.jsbeautifyrc'  = 'nf-seti-json'
                '.esformatter'   = 'nf-seti-json'
                'cdp.pid'        = 'nf-seti-json'
                '.htaccess'      = 'nf-mdi-xml'
                '.jshintignore'  = 'nf-fa-gear'
                '.buildignore'   = 'nf-fa-gear'
                '.mrconfig'      = 'nf-fa-gear'
                '.yardopts'      = 'nf-fa-gear'
                'manifest.mf'    = 'nf-fa-gear'
                '.clang-format'  = 'nf-fa-gear'
                '.clang-tidy'    = 'nf-fa-gear'
            }

            # Archive files
            '.7z'                   = 'nf-oct-file_zip'
            '.bz'                   = 'nf-oct-file_zip'
            '.tar'                  = 'nf-oct-file_zip'
            '.zip'                  = 'nf-oct-file_zip'
            '.gz'                   = 'nf-oct-file_zip'
            '.xz'                   = 'nf-oct-file_zip'
            '.br'                   = 'nf-oct-file_zip'
            '.bzip2'                = 'nf-oct-file_zip'
            '.gzip'                 = 'nf-oct-file_zip'
            '.brotli'               = 'nf-oct-file_zip'
            '.rar'                  = 'nf-oct-file_zip'
            '.tgz'                  = 'nf-oct-file_zip'

            # Executable things
            '.bat'                  = 'nf-custom-msdos'
            '.cmd'                  = 'nf-custom-msdos'
            '.exe'                  = 'nf-mdi-application'
            '.pl'                   = 'nf-dev-perl'
            '.ps1'                  = 'nf-dev-terminal_badge'
            '.rb'                   = 'nf-oct-ruby'
            '.sh'                   = 'nf-oct-terminal'

            # Javascript
            '.js'                   = 'nf-dev-javascript'
            '.esx'                  = 'nf-dev-javascript'
            '.mjs'                  = 'nf-dev-javascript'

            # React
            '.jsx'                  = 'nf-dev-react'
            '.tsx'                  = 'nf-dev-react'

            # Typescript
            '.ts'                   = 'nf-seti-typescript'

            # Not-executable code files
            '.dll'                  = 'nf-fa-archive'
            '.psm1'                 = 'nf-fa-archive'

            # Importable Data files
            '.clixml'               = 'nf-dev-code_badge'
            '.csv'                  = 'nf-mdi-file_excel'
            '.tsv'                  = 'nf-mdi-file_excel'
            '.ps1xml'               = 'nf-mdi-file_xml'
            '.psd1'                 = 'nf-mdi-code_braces'

            # Settings
            '.ini'                  = 'nf-fa-gear'
            '.dlc'                  = 'nf-fa-gear'
            '.config'               = 'nf-fa-gear'
            '.conf'                 = 'nf-fa-gear'
            '.properties'           = 'nf-fa-gear'
            '.prop'                 = 'nf-fa-gear'
            '.settings'             = 'nf-fa-gear'
            '.option'               = 'nf-fa-gear'
            '.reg'                  = 'nf-fa-gear'
            '.props'                = 'nf-fa-gear'
            '.toml'                 = 'nf-fa-gear'
            '.prefs'                = 'nf-fa-gear'
            '.sln.dotsettings'      = 'nf-fa-gear'
            '.sln.dotsettings.user' = 'nf-fa-gear'
            '.cfg'                  = 'nf-fa-gear'

            # Source Files
            '.c'                    = 'nf-mdi-language_c'
            '.cpp'                  = 'nf-mdi-language_cpp'
            '.fs'                   = 'nf-dev-fsharp'
            '.go'                   = 'nf-dev-go'
            '.php'                  = 'nf-dev-php'

            # Visual Studio
            '.csproj'               = 'nf-dev-visualstudio'
            '.ruleset'              = 'nf-dev-visualstudio'
            '.sln'                  = 'nf-dev-visualstudio'
            '.suo'                  = 'nf-dev-visualstudio'
            '.vb'                   = 'nf-dev-visualstudio'
            '.vbs'                  = 'nf-dev-visualstudio'
            '.vcxitems'             = 'nf-dev-visualstudio'
            '.vcxitems.filters'     = 'nf-dev-visualstudio'
            '.vcxproj'              = 'nf-dev-visualstudio'
            '.vsxproj.filters'      = 'nf-dev-visualstudio'

            # CSharp
            '.cs'                   = 'nf-mdi-language_csharp'
            '.csx'                  = 'nf-mdi-language_csharp'

            # Database
            '.pdb'                  = 'nf-dev-database'
            '.sql'                  = 'nf-dev-database'
            '.pks'                  = 'nf-dev-database'
            '.pkb'                  = 'nf-dev-database'
            '.accdb'                = 'nf-dev-database'
            '.mdb'                  = 'nf-dev-database'
            '.sqlite'               = 'nf-dev-database'
            '.pgsql'                = 'nf-dev-database'
            '.postgres'             = 'nf-dev-database'
            '.psql'                 = 'nf-dev-database'

            # Source Control
            '.git'                  = 'nf-dev-git'
            '.gitignore'            = 'nf-dev-git'
            '.gitattribute'         = 'nf-dev-git'

            # Project files
            '.user'                 = 'nf-mdi-visualstudio'
            '.code-workspace'       = 'nf-mdi-visualstudio'

            # Text data files
            '.log'                  = 'nf-mdi-file_document'
            '.txt'                  = 'nf-mdi-file_document'

            # HTML/css
            '.html'                 = 'nf-seti-html'
            '.htm'                  = 'nf-seti-html'
            '.xhtml'                = 'nf-seti-html'
            '.html_vm'              = 'nf-seti-html'
            '.asp'                  = 'nf-seti-html'
            '.css'                  = 'nf-dev-css3'
            '.sass'                 = 'nf-dev-sass'
            '.less'                 = 'nf-dev-less'

            # Markdown
            '.md'                   = 'nf-dev-markdown'
            '.markdown'             = 'nf-dev-markdown'
            '.rst'                  = 'nf-dev-markdown'

            # JSON
            '.json'                 = 'nf-seti-json'
            '.tsbuildinfo'          = 'nf-seti-json'

            # YAML
            '.yml'                  = 'nf-mdi-format_align_left'
            '.yaml'                 = 'nf-mdi-format_align_left'

            # XML
            '.xml'                  = 'nf-mdi-xml'
            '.plist'                = 'nf-mdi-xml'
            '.xsd'                  = 'nf-mdi-xml'
            '.dtd'                  = 'nf-mdi-xml'
            '.xsl'                  = 'nf-mdi-xml'
            '.xslt'                 = 'nf-mdi-xml'
            '.resx'                 = 'nf-mdi-xml'
            '.iml'                  = 'nf-mdi-xml'
            '.xquery'               = 'nf-mdi-xml'
            '.tmLanguage'           = 'nf-mdi-xml'
            '.manifest'             = 'nf-mdi-xml'
            '.project'              = 'nf-mdi-xml'

            # Documents
            '.chm'                  = 'nf-mdi-help_box'
            '.doc'                  = 'nf-mdi-file_word'
            '.docx'                 = 'nf-mdi-file_word'
            '.pdf'                  = 'nf-mdi-file_pdf'
            '.xls'                  = 'nf-mdi-file_excel'
            '.xlsx'                 = 'nf-mdi-file_excel'

            # Images
            '.png'                  = 'nf-fa-file_image_o'
            '.jpeg'                 = 'nf-fa-file_image_o'
            '.jpg'                  = 'nf-fa-file_image_o'
            '.gif'                  = 'nf-fa-file_image_o'
            '.ico'                  = 'nf-fa-file_image_o'
            '.tif'                  = 'nf-fa-file_image_o'
            '.tiff'                 = 'nf-fa-file_image_o'
            '.psd'                  = 'nf-fa-file_image_o'
            '.psb'                  = 'nf-fa-file_image_o'
            '.ami'                  = 'nf-fa-file_image_o'
            '.apx'                  = 'nf-fa-file_image_o'
            '.bmp'                  = 'nf-fa-file_image_o'
            '.bpg'                  = 'nf-fa-file_image_o'
            '.brk'                  = 'nf-fa-file_image_o'
            '.cur'                  = 'nf-fa-file_image_o'
            '.dds'                  = 'nf-fa-file_image_o'
            '.dng'                  = 'nf-fa-file_image_o'
            '.eps'                  = 'nf-fa-file_image_o'
            '.exr'                  = 'nf-fa-file_image_o'
            '.fpx'                  = 'nf-fa-file_image_o'
            '.gbr'                  = 'nf-fa-file_image_o'
            '.img'                  = 'nf-fa-file_image_o'
            '.jbig2'                = 'nf-fa-file_image_o'
            '.jb2'                  = 'nf-fa-file_image_o'
            '.jng'                  = 'nf-fa-file_image_o'
            '.jxr'                  = 'nf-fa-file_image_o'
            '.pbm'                  = 'nf-fa-file_image_o'
            '.pgf'                  = 'nf-fa-file_image_o'
            '.pic'                  = 'nf-fa-file_image_o'
            '.raw'                  = 'nf-fa-file_image_o'
            '.webp'                 = 'nf-fa-file_image_o'

            # VSCode
            '.vscodeignore'         = 'nf-fa-gear'
            '.vsixmanifest'         = 'nf-fa-gear'
            '.vsix'                 = 'nf-fa-gear'
            '.code-workplace'       = 'nf-fa-gear'

            # Sublime
            '.sublime-project'      = 'nf-dev-sublime'
            '.sublime-workspace'    = 'nf-dev-sublime'
        }
    }
}
