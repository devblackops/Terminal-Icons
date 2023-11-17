# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.12.0] Unreleased

### Fixed

- Module load time is improved due to pre-processing theme files

### Added

- Add `Get-TerminalIconsPreference` function to retrieve current module preferences
- Add `Set-TerminalIconsPreference` function to set module preferences
- Add ability to format file/folder date times in difference formats and display in either local or UTC time
- Add ability to display file sizes in KB, MB, or GB
- Add ability to display file/folder name in normal, bold, italic, or underlined font
- Add icon and color for wellknown file `jenkinsfile`.
- Add icon and color for c++ files (.cxx and .c++)
- Add icon and color for wellknown file `makefile`.
- Add icon and color for svelte files (.svelte).
- Add icon and color for generic database files (.db)
- Add icon and color for Scala Build Tool files (.sbt)

### Changed

- On MacOS and Linux, display the `UnixMode` property instead of `Mode`. Also display the `User`, and `Group` properties

## [0.11.0] 2023-07-05

### Added

- [**#104**](https://github.com/devblackops/Terminal-Icons/pull/104) Migrate to Nerd Font v3 (via [@Tiberriver256](https://github.com/Tiberriver256)
- [**#92**](https://github.com/devblackops/Terminal-Icons/pull/92) - Add icon and color for  `artifacts` wellknown folder (via [@wangkanai](https://github.com/wangkanai))
- [**#91**](https://github.com/devblackops/Terminal-Icons/pull/91) - Add icons and colors for  `demo` and `sample` wellknown folders (via [@wangkanai](https://github.com/wangkanai))
- [**#90**](https://github.com/devblackops/Terminal-Icons/pull/90) - Add icon and color for `benchmark` wellknown folder (via [@wangkanai](https://github.com/wangkanai))
- Add glyphs from Nerd Font v2.2.0 (must have a Nerd Font >= 2.2.0 installed to see these)
- Add icon and color for Puppet (.pp and .epp)
- Add icon and color for bicep (.bicep)
- Add icon and color for `output` wellknown folder
- Add icon and color for Scala (.scala, .sc)
- Add icon and color for Autodesk Inventor (.iLogicVb)

## [0.10.0] 2022-07-06

### Added

- [**#80**](https://github.com/devblackops/Terminal-Icons/pull/80) - Added light color theme `devblackops_light` (via [@TamKengHong](https://github.com/TamKengHong))
- Add icon and color for Julia language file (.jl)
- Add icon and color for Vim (.vim)
- Add icon and color for Sass (.scss)

### Fixed

- [**#68**](https://github.com/devblackops/Terminal-Icons/issues/68) Symlink rendering on Windows PowerShell

## [0.9.0] 2022-01-27

### Added

- Add icon and color R language files (.R, .Rmd, and .Rproj)

## [0.8.0] 2021-12-15

### Added

- [**#60**](https://github.com/devblackops/Terminal-Icons/pull/60) Add support for Gradle (*.gradle and gradlew) files (via [@Hexeption](https://github.com/Hexeption))
- [**#58**](https://github.com/devblackops/Terminal-Icons/pull/58) Add support for Jupyter notebook (*.ipynb) files (via [@gaardhus](https://github.com/gaardhus))

## [0.7.1] 2021-11-22

### Fixed

- Set default preferences if the preferences XML file cannot be parsed for any reason.

## [0.7.0] 2021-11-10

### Added

- [**#53**](https://github.com/devblackops/Terminal-Icons/pull/53) Add color and icon for handlebar (.hbs) files (via [@nikouu](https://github.com/nikouu))

## [0.6.0] 2021-11-08

### Added

- [**#44**](https://github.com/devblackops/Terminal-Icons/pull/44) Added icons for .msi, .msix, .msixbundle, .appx, .appxbundle, .deb, .rpm, .jar, .srt, .lrc, .ass, .wav, .acc, .opus, .vmdk, .vhdx, .iso. (via [@KaranKad](https://github.com/KaranKad))
- Added option to turn off displaying custom icons or colors with `-DisableIconTheme` and `-DisableColorTheme` switches on the `Set-TerminalIconsTheme` command.

### Changed

- [**#44**](https://github.com/devblackops/Terminal-Icons/pull/44) Changed .img icon to match other disk image formats (via [@KaranKad](https://github.com/KaranKad))

### Removed

- Removed deprecated commands `Set-TerminalIconsColorTheme` and `Set-TerminalIconsIconTheme`. Use `Set-TerminalIconsTheme` instead.

## [0.5.2] 2021-06-18

### Added

- [**#39**](https://github.com/devblackops/Terminal-Icons/pull/39) Added icon and color for Visual Studio Solution filter files (.slnf) (via [@kkoziarski](https://github.com/kkoziarski))

## [0.5.1] 2021-05-21

### Added

- Add icon for `gruntfile.js`

### Changed

- Theme files and preferences are now stored in the directory defined by `$env:XDG_CONFIG_HOME` (if it exists) on Linux and macOS. If not defined, the default of `$HOME/local/share/powershell/Community/Terminal-Icons` is still used.
- `Get-TerminalIconsGlyphs` now returns glyphs sorted by name

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
