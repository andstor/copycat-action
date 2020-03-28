# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org).

## [Unreleased]

## [3.0.1] - 2020-03-28
### Fixed
- Fix copying of files with names containing spaces.

## [3.0.0] - 2020-03-10
### Added
- Input variable `clean` for optional removal of contents in the `dst_path` before copying.
- Input variable `exclude` for path exclusion filter with glob patterns.
- Input variable `filter` for path filtering with glob patterns.
### Changed
- Renamed input variable `src_filter` to `file_filter`.

## [2.0.0] - 2020-02-23

## [1.1.0] - 2019-08-29

## [1.0.1] - 2019-07-09

## 1.0.0 - 2019-07-09

[Unreleased]: https://github.com/andstor/copycat-action/compare/v3.0.1...HEAD
[3.0.1]: https://github.com/andstor/copycat-action/compare/v3.0.0...v3.0.1
[3.0.0]: https://github.com/andstor/copycat-action/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/andstor/copycat-action/compare/v1.1.0...v2.0.0
[1.1.0]: https://github.com/andstor/copycat-action/compare/v1.1.0...v1.0.1
[1.0.1]: https://github.com/andstor/copycat-action/compare/v1.0.1...v1.0.1
[1.0.1]: https://github.com/andstor/copycat-action/compare/v1.0.0...v1.0.1
