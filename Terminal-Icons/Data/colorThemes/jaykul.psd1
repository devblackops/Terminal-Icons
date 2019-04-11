# Based on Jayku's color theme
# https://github.com/Jaykul/Profile/blob/master/Configuration.psd1

@{
    types = @{
        directories = @{
            # Default directory color
            ''        = "`e[0m"

            wellKnown = @{
                docs = "`e[38;2;255;255;255m"
            }
        }

        files  = @{

            wellKnown         = @{
                '.gitattributes' = "`e[38;2;30;144;255m"
                '.gitignore'     = "`e[38;2;30;144;255m"
                'LICENSE'        = "`e[38;2;255;215;0m"
                'README.md'      = "`e[38;2;255;215;0m"
                '.DS_Store'      = "`e[39m"
            }

            ''                = "`e[0m"

            # Archive files are some shade of green
            ".7z"             = "`e[38;2;179;230;204m"
            ".bz"             = "`e[38;2;179;230;204m"
            ".tar"            = "`e[38;2;179;230;204m"
            ".zip"            = "`e[38;2;179;230;204m"

            # Executable things are shades of red
            ".bat"            = "`e[38;2;255;99;71m"
            ".cmd"            = "`e[38;2;255;99;71m"
            ".exe"            = "`e[38;2;220;20;60m"
            ".js"             = "`e[38;2;255;99;71m"
            ".pl"             = "`e[38;2;255;99;71m"
            ".ps1"            = "`e[38;2;255;99;71m"
            ".rb"             = "`e[38;2;255;99;71m"
            ".sh"             = "`e[38;2;255;99;71m"

            # Not-executable code files are shades of yellow
            ".dll"            = "`e[38;2;255;215;0m"
            ".pdb"            = "`e[38;2;255;204;0m"
            ".psm1"           = "`e[38;2;255;215;0m"

            # Importable Data files are shades of blue
            ".clixml"         = "`e[38;2;30;144;255m"
            ".csv"            = "`e[38;2;30;144;255m"
            ".json"           = "`e[38;2;30;144;255m"
            ".ps1xml"         = "`e[38;2;30;144;255m"
            ".psd1"           = "`e[38;2;30;144;255m"
            ".yml"            = "`e[38;2;30;144;255m"
            ".xml"            = "`e[38;2;30;144;255m"

            # Config files
            ".conf"           = "`e[38;2;64;224;208m"
            ".config"         = "`e[38;2;64;224;208m"
            ".reg"            = "`e[38;2;64;224;208m"
            ".vscode"         = "`e[38;2;64;224;208m"

            # Source Files
            ".cs"             = "`e[38;2;255;215;0m"
            ".fs"             = "`e[38;2;255;215;0m"

            # Source Control
            ".git"            = "`e[38;2;255;69;0m"
            ".gitignore"      = "`e[38;2;255;69;0m"
            ".gitattribute"   = "`e[38;2;255;69;0m"

            # Project files
            ".csproj"         = "`e[38;2;199;21;133m"
            ".sln"            = "`e[38;2;199;21;133m"
            ".user"           = "`e[38;2;64;224;208m"
            ".code-workspace" = "`e[38;2;0;204;0m"

            # Text data file #00BFFF
            ".log"            = "`e[38;2;0;191;255m"
            ".txt"            = "`e[38;2;0;191;255m"

            # Documents
            ".chm"            = "`e[38;2;127;255;212m"
            ".doc"            = "`e[38;2;127;255;212m"
            ".docx"           = "`e[38;2;127;255;212m"
            ".htm"            = "`e[38;2;127;255;212m"
            ".html"           = "`e[38;2;127;255;212m"
            ".pdf"            = "`e[38;2;127;255;212m"
            ".md"             = "`e[38;2;127;255;212m"
            ".xls"            = "`e[38;2;127;255;212m"
            ".xlsx"           = "`e[38;2;127;255;212m"
        }
    }
}
