Describe 'Format-TerminalIcons' {
    BeforeAll {
        $folderName = [System.IO.Path]::GetRandomFileName().Split('.')[0]
        $fileName   = [System.IO.Path]::GetRandomFileName().Split('.')[0] + '.someextension'
        $folder     = New-Item -Path "TestDrive:/$folderName" -Type Directory
        $file       = New-Item -Path "TestDrive:/$fileName"
    }

    Context 'Folder icon resolution' {
        It 'Resolves a random directory to a default icon' {
            $string = $folder | Format-TerminalIcons
            $string | Should -BeLike "*$([char]0xf413)*"
        }
    }

    Context 'File icon resolution' {
        It 'Resolves a random file to a default icon' {
            $string = $file | Format-TerminalIcons
            $string | Should -BeLike "*$([char]0xf15b)*"
        }
    }

    Context 'Deserialized object handling' {
        BeforeAll {
            # Create mock deserialized DirectoryInfo object
            $deserializedFolder = [PSCustomObject]@{
                PSTypeName    = 'Deserialized.System.IO.DirectoryInfo'
                Name          = 'TestFolder'
                PSIsContainer = $true
                Extension     = ''
                LinkType      = $null
                Target        = $null
            }
            $deserializedFolder.PSObject.TypeNames.Insert(0, 'Deserialized.System.IO.DirectoryInfo')

            # Create mock deserialized FileInfo object
            $deserializedFile = [PSCustomObject]@{
                PSTypeName    = 'Deserialized.System.IO.FileInfo'
                Name          = 'TestFile.ps1'
                PSIsContainer = $false
                Extension     = '.ps1'
                LinkType      = $null
                Target        = $null
            }
            $deserializedFile.PSObject.TypeNames.Insert(0, 'Deserialized.System.IO.FileInfo')

            # Create mock deserialized symlink object
            $deserializedSymlink = [PSCustomObject]@{
                PSTypeName    = 'Deserialized.System.IO.FileInfo'
                Name          = 'TestLink'
                PSIsContainer = $false
                Extension     = ''
                LinkType      = 'SymbolicLink'
                Target        = 'C:\Target\Path'
            }
            $deserializedSymlink.PSObject.TypeNames.Insert(0, 'Deserialized.System.IO.FileInfo')
        }

        It 'Accepts deserialized DirectoryInfo objects' {
            { $deserializedFolder | Format-TerminalIcons } | Should -Not -Throw
        }

        It 'Accepts deserialized FileInfo objects' {
            { $deserializedFile | Format-TerminalIcons } | Should -Not -Throw
        }

        It 'Resolves deserialized directory to a default icon' {
            $string = $deserializedFolder | Format-TerminalIcons
            $string | Should -BeLike "*$([char]0xf413)*"
        }

        It 'Resolves deserialized file to a default icon' {
            $string = $deserializedFile | Format-TerminalIcons
            $string | Should -BeLike "*$([char]0xf15b)*"
        }

        It 'Handles deserialized symlink objects without error' {
            { $deserializedSymlink | Format-TerminalIcons } | Should -Not -Throw
        }

        It 'Includes target path for deserialized symlinks' {
            $string = $deserializedSymlink | Format-TerminalIcons
            $string | Should -BeLike "*Target*"
        }
    }
}
