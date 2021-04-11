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
}
