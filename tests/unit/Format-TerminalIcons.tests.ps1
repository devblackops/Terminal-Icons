Describe 'Format-TerminalIcons' {
    BeforeAll {
        $outputDir       = [IO.Path]::Combine($env:BHProjectPath, 'Output')
        $outputModDir    = [IO.Path]::Combine($outputDir, $env:BHProjectName)
        $manifest        = Test-ModuleManifest $env:BHPSModuleManifest
        $outputModVerDir = [IO.Path]::Combine($outputModDir, $manifest.Version)
        $outputManifest  = [IO.Path]::Combine($outputModVerDir, "$env:BHProjectName.psd1")
        Remove-Module $env:BHProjectName -ErrorAction Ignore
        Import-Module -Name $outputManifest -Verbose:$false -ErrorAction Stop

        $folderName = [System.IO.Path]::GetRandomFileName().Split('.')[0]
        $fileName   = [System.IO.Path]::GetRandomFileName().Split('.')[0] + '.someextension'
        $folder     = New-Item -Path "TestDrive:/$folderName" -Type Directory
        $file       = New-Item -Path "TestDrive:/$fileName"
    }

    Context 'Folder icon resolution' {
        It 'Resolves a random directory to a default icon' {
            $string = $folder | Format-TerminalIcons
            $string.Substring(0,1) | should -be "$([char]0xf413)"
        }
    }

    Context 'File icon resolution' {
        It 'Resolves a random file to a default icon' {
            $string = $file | Format-TerminalIcons
            $string.Substring(0,1) | should -be "$([char]0xf15b)"
        }
    }
}
