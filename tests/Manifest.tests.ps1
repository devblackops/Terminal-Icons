Describe 'Module manifest' {

    BeforeAll {
        $moduleName         = $env:BHProjectName
        $manifest           = Test-ModuleManifest $env:BHPSModuleManifest
        $outputDir          = [IO.Path]::Combine($ENV:BHProjectPath, 'Output')
        $outputModDir       = [IO.Path]::Combine($outputDir, $env:BHProjectName)
        $outputModVerDir    = [IO.Path]::Combine($outputModDir, $manifest.Version)
        $outputManifestPath = [IO.Path]::Combine($outputModVerDir, "$($moduleName).psd1")
        $changelogPath      = [IO.Path]::Combine($env:BHProjectPath, 'CHANGELOG.md')
    }

    Context 'Validation' {

        $script:manifest = $null

        It 'has a valid manifest' {
            {
                $script:manifest = Test-ModuleManifest -Path $outputManifestPath -Verbose:$false -ErrorAction Stop -WarningAction SilentlyContinue
            } | Should -Not -Throw
        }

        It 'has a valid name in the manifest' {
            $script:manifest.Name | Should -Be $env:BHProjectName
        }

        It 'has a valid root module' {
            $script:manifest.RootModule | Should -Be "$($moduleName).psm1"
        }

        It 'has a valid version in the manifest' {
            $script:manifest.Version -as [Version] | Should -Not -BeNullOrEmpty
        }

        It 'has a valid description' {
            $script:manifest.Description | Should -Not -BeNullOrEmpty
        }

        It 'has a valid author' {
            $script:manifest.Author | Should -Not -BeNullOrEmpty
        }

        It 'has a valid guid' {
            {
                [guid]::Parse($script:manifest.Guid)
            } | Should -Not -Throw
        }

        It 'has a valid copyright' {
            $script:manifest.CopyRight | Should -Not -BeNullOrEmpty
        }

        $script:changelogVersion = $null
        It 'has a valid version in the changelog' {
            foreach ($line in (Get-Content $changelogPath)) {
                if ($line -match "^##\s\[(?<Version>(\d+\.){1,3}\d+)\]") {
                    $script:changelogVersion = $matches.Version
                    break
                }
            }
            $script:changelogVersion               | Should -Not -BeNullOrEmpty
            $script:changelogVersion -as [Version] | Should -Not -BeNullOrEmpty
        }

        It 'changelog and manifest versions are the same' {
            $script:changelogVersion -as [Version] | Should -Be ( $script:manifest.Version -as [Version] )
        }

        if (Get-Command git.exe -ErrorAction SilentlyContinue) {
            $script:tagVersion = $null
            It 'is tagged with a valid version' -skip {
                $thisCommit = git.exe log --decorate --oneline HEAD~1..HEAD

                if ($thisCommit -match 'tag:\s*(\d+(?:\.\d+)*)') {
                    $script:tagVersion = $matches[1]
                }

                $script:tagVersion               | Should -Not -BeNullOrEmpty
                $script:tagVersion -as [Version] | Should -Not -BeNullOrEmpty
            }

            It 'all versions are the same' {
                $script:changelogVersion -as [Version] | Should -Be ( $script:manifest.Version -as [Version] )
            }
        }
    }
}
