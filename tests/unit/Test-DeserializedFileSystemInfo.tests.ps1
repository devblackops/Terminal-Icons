Describe 'Test-DeserializedFileSystemInfo' {
    BeforeAll {
        # Import the module to get access to private functions
        $modulePath = Join-Path $PSScriptRoot '..\..\Terminal-Icons\Terminal-Icons.psd1'
        Import-Module $modulePath -Force

        # Get the private function
        $testFunction = Get-Command Test-DeserializedFileSystemInfo -Module Terminal-Icons -ErrorAction SilentlyContinue
        if (-not $testFunction) {
            # If not exported, dot-source the private function file
            . (Join-Path $PSScriptRoot '..\..\Terminal-Icons\Private\Test-DeserializedFileSystemInfo.ps1')
        }
    }

    Context 'Local FileSystemInfo objects' {
        BeforeAll {
            $folderName = [System.IO.Path]::GetRandomFileName().Split('.')[0]
            $fileName   = [System.IO.Path]::GetRandomFileName().Split('.')[0] + '.txt'
            $folder     = New-Item -Path "TestDrive:/$folderName" -Type Directory
            $file       = New-Item -Path "TestDrive:/$fileName"
        }

        It 'Returns $false for local DirectoryInfo objects' {
            Test-DeserializedFileSystemInfo -InputObject $folder | Should -Be $false
        }

        It 'Returns $false for local FileInfo objects' {
            Test-DeserializedFileSystemInfo -InputObject $file | Should -Be $false
        }
    }

    Context 'Deserialized FileSystemInfo objects' {
        BeforeAll {
            # Create mock deserialized DirectoryInfo object
            $deserializedFolder = [PSCustomObject]@{
                Name          = 'TestFolder'
                PSIsContainer = $true
                Extension     = ''
            }
            $deserializedFolder.PSObject.TypeNames.Insert(0, 'Deserialized.System.IO.DirectoryInfo')

            # Create mock deserialized FileInfo object
            $deserializedFile = [PSCustomObject]@{
                Name          = 'TestFile.ps1'
                PSIsContainer = $false
                Extension     = '.ps1'
            }
            $deserializedFile.PSObject.TypeNames.Insert(0, 'Deserialized.System.IO.FileInfo')
        }

        It 'Returns $true for deserialized DirectoryInfo objects' {
            Test-DeserializedFileSystemInfo -InputObject $deserializedFolder | Should -Be $true
        }

        It 'Returns $true for deserialized FileInfo objects' {
            Test-DeserializedFileSystemInfo -InputObject $deserializedFile | Should -Be $true
        }
    }

    Context 'Other object types' {
        It 'Returns $false for string objects' {
            Test-DeserializedFileSystemInfo -InputObject 'test' | Should -Be $false
        }

        It 'Returns $false for hashtable objects' {
            Test-DeserializedFileSystemInfo -InputObject @{Name='test'} | Should -Be $false
        }

        It 'Returns $false for generic PSCustomObject' {
            $obj = [PSCustomObject]@{Name='test'}
            Test-DeserializedFileSystemInfo -InputObject $obj | Should -Be $false
        }
    }
}
