# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.5.0] 2021-04-20

### Added

- [**#PR35**](https://github.com/devblackops/Terminal-Icons/pull/35) Add `Get-TerminalIconsGlyphs` and `Set-TerminalIconsIcon` functions (via [@tillig](https://github.com/tillig))
  - `Get-TerminalIconsGlyphs` returns the list of glyphs available
  - `Set-TerminalIconsIcon` set a specific icon in the current icon theme or allows for swapping one glyph for another. Changes are not persisted between PowerShell sessions.

### Fixed

- Replace glyphs that are causing alignment issues
- Fixed module import error when user directory containing saved themes did not exist

## [0.4.0] 2021-04-18

### Added

- [**#PR27**](https://github.com/devblackops/Terminal-Icons/pull/27) Add icon for Umbraco .NET CMS common folder (via [@warrenbuckley](https://github.com/warrenbuckley))
- [**#PR30**](https://github.com/devblackops/Terminal-Icons/pull/30) Add `.gitconfig` and `.vscode-insiders` icons/colors (via [@MJECloud](https://github.com/MJECloud))
- Added function `Set-TerminalIconsTheme` to set icon/color theme. Existing functions `Set-TerminalIconsColorTheme` and `Set-TerminalIconsIconTheme` have been deprecated and will be removed in a later version
- Added function `Remove-TerminalIconsTheme` to remove an icon or color theme

### Changed

- Minimum PowerShell verison is now `5.1`

### Fixed

- Adding a new icon or color theme no longer raises errors

## [0.3.1] 2021-04-09

### Fixed

- [**#PR26**](https://github.com/devblackops/Terminal-Icons/pull/26) Display file when no extension is present (via [@zanseb](https://github.com/zanseb))

## [0.3.0] 2021-04-08

### Added

- Icon and color for symlinks and junctions are now shown, along with the target path.
- [**#PR23**](https://github.com/devblackops/Terminal-Icons/pull/23) Add icons/colors for common folders `.aws`, `.Azure`, `.kube`, and `.docker` (via [@cdhunt](https://github.com/cdhunt))

### Fixed

- Colors/icons for files with more than one extension now have the theme applied.

## [0.2.2] 2020-01-10

### Added

- New icons and colors for Terraform files (via [@TravisTX](https://github.com/TravisTX))

## [0.2.1] 2020-11-30

### Added

- New icons and colors for Python (.py) and Java (.java) files.

## [0.2.0] 2020-11-15

### Added

- New icons and colors for well-known folder names (via [@rashil2000](https://github.com/rashil2000))

### Changed

- Module load time has been improved by ~4x by storing the current theme on disk in XML format (Export-CliXml) instead of PSD1.

## [0.1.1] 2019-06-11

### Changed

- Store RGB color values instead of escape sequences in the theme data stored in the user profile.

### Fixed

- Changed `glyphs.ps1` to `UTF8 with BOM` so it's compatible with Windows PowerShell.
- Changed minimum PowerShell version to `v4.0` as the `.ForEach()` and `.Where()` methods are used internally.
- Fixed use of escape sequences to be compatible with Windows PowerShell and the default console.

## [0.1.0] 2019-06-09

### Added

- Initial release
