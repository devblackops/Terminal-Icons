InModuleScope 'Terminal-Icons' {
    Describe 'Add-TerminalIconsColorTheme' {
        Context 'Themes' {
            AfterAll {
                $themeStorage = Get-ThemeStoragePath
                Set-TerminalIconsTheme -ColorTheme devblackops -IconTheme devblackops
                Remove-Item (Join-Path $themeStorage 'MyAwesomeTheme_color.xml') -Force -ErrorAction SilentlyContinue
            }

            Mock Export-CliXml {}

            it 'Good theme should be added' {
                Add-TerminalIconsColorTheme -Path $PSScriptRoot/../MyAwesomeColorTheme.psd1 # $goodTheme.FullName -Force
                $script:current.Themes.Color['MyAwesomeTheme']      | Should -BeOfType System.Collections.Hashtable
                $script:current.Themes.Color['MyAwesomeTheme'].Name | Should -Be 'MyAwesomeTheme'
            }

            it 'Bad theme path should throw' {
                $badThemeFile = [guid]::NewGuid().ToString()
                {Add-TerminalIconsColorTheme -Path "./$badThemeFile" -ErrorAction Stop} | Should -Throw
            }
        }
    }
}
