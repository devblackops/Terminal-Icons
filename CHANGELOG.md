# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

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
