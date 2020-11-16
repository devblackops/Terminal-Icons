InModuleScope 'Terminal-Icons' {
    Describe 'Add-TerminalIconsIconTheme' {

        Context 'Themes' {

            BeforeAll {
                $tmpDir    = [IO.Path]::GetTempPath()
                $themePath = [IO.Path]::Combine($tmpDir, 'MyAwesomeTheme.psd1')
                $script:goodTheme = New-Item -Path $themePath -Force

                $themeContent = @'
@{
    Name  = 'MyAwesomeTheme'
    Types = @{
        Directories = @{
            WellKnown = @{
            }
        }
        Files       = @{
            WellKnown = @{
            }
        }
    }
}
'@
            $themeContent  | Out-File $goodTheme -Encoding utf8
            $goodThemeName = $goodTheme.BaseName
            }

            AfterAll {
                $goodTheme | Remove-Item
            }

            Mock Export-CliXml {}



            it 'Good theme should be added' {
                Add-TerminalIconsIconTheme -Path $goodTheme.FullName -Force
                $script:themeData.Themes.Icon[$goodThemeName]      | Should -BeOfType System.Collections.Hashtable
                $script:themeData.Themes.Icon[$goodThemeName].Name | Should -Be 'MyAwesomeTheme'
            }

            it 'Bad theme path should throw' {
                $badThemeFile = [guid]::NewGuid().ToString()
                {Add-TerminalIconsIconTheme -Path "./$badThemeFile" -ErrorAction Stop} | Should -Throw
            }
        }
    }
}
