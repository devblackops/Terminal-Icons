InModuleScope 'Terminal-Icons' {
    Describe 'Add-TerminalIconsIconTheme' {
        Context 'Themes' {
            AfterAll {
                $themeStorage = Get-ThemeStoragePath
                Set-TerminalIconsTheme -ColorTheme devblackops -IconTheme devblackops
                Remove-Item (Join-Path $themeStorage 'MyAwesomeTheme_icon.xml') -Force -ErrorAction SilentlyContinue
            }

            Mock Export-CliXml {}

            it 'Good theme should be added' {
                Add-TerminalIconsIconTheme -Path $PSScriptRoot/../MyAwesomeIconTheme.psd1 -Force
                $script:current.Themes.Icon['MyAwesomeTheme']      | Should -BeOfType System.Collections.Hashtable
                $script:current.Themes.Icon['MyAwesomeTheme'].Name | Should -Be 'MyAwesomeTheme'
            }

            it 'Bad theme path should throw' {
                $badThemeFile = [guid]::NewGuid().ToString()
                {Add-TerminalIconsIconTheme -Path "./$badThemeFile" -ErrorAction Stop} | Should -Throw
            }
        }
    }
}
