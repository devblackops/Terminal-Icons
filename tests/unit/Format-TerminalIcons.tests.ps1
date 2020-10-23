$outputDir       = [IO.Path]::Combine($env:BHProjectPath, 'Output')
$outputModDir    = [IO.Path]::Combine($outputDir, $env:BHProjectName)
$manifest        = Test-ModuleManifest $env:BHPSModuleManifest
#Import-LocalizedData -BaseDirectory (Split-Path $env:BHPSModuleManifest -Parent) -FileName (Split-Path $env:BHPSModuleManifest -Leaf) -BindingVariable manifest
#$manifest        = Import-PowerShellDataFile -Path $env:BHPSModuleManifest
$outputModVerDir = [IO.Path]::Combine($outputModDir, $manifest.Version)
$outputManifest  = [IO.Path]::Combine($outputModVerDir, "$env:BHProjectName.psd1")
Remove-Module $env:BHProjectName -ErrorAction Ignore
Import-Module -Name $outputManifest -Verbose:$false -ErrorAction Stop

describe 'Format-TerminalIcons' {
    context 'Folder icon resolution' {
        $folderName = [System.IO.Path]::GetRandomFileName().Split('.')[0]
        $folder = New-Item -Path "TestDrive:/$folderName" -Type Directory
        $string = $folder | Format-TerminalIcons
        it 'Resolves a random directory to a default icon' {
            $string.Substring(0,1) | should -be "$([char]0xf413)"
        }
    }

    context 'File icon resolution' {
        $fileName = [System.IO.Path]::GetRandomFileName().Split('.')[0] + '.someextension'
        $file = New-Item -Path "TestDrive:/$fileName"
        $string = $file | Format-TerminalIcons
        it 'Resolves a random file to a default icon' {
            $string.Substring(0,1) | should -be "$([char]0xf15b)"
        }
    }
}
