describe 'Format-TerminalIcons' {
    context 'Folder icon resolution' {
        $folderName = [System.IO.Path]::GetRandomFileName().Split('.')[0]
        $folder = New-Item -Path "TestDrive:/$folderName" -Type Directory
        $string = $folder | Format-TerminalIcons
        it 'Resolves a random directory to a default icon' {
            $string.Substring(1,3) | should -be '[0m'
            $string.Substring(4,1) | should -be "$([char]0xf07b)"
        }
    }

    context 'File icon resolution' {
        $fileName = [System.IO.Path]::GetRandomFileName().Split('.')[0] + '.someextension'
        $file = New-Item -Path "TestDrive:/$fileName"
        $string = $file | Format-TerminalIcons
        it 'Resolves a random file to a default icon' {
            $string.Substring(1,3) | should -be '[0m'
            $string.Substring(4,1) | should -be "$([char]0xf15b)"
        }
    }
}
