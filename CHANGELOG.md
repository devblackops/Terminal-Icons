# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

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
