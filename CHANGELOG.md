# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org).

## [Unreleased]

## [3.2.4] - 2021-05-05
### Fixed
- Show correct destination repository in log output.

## [3.2.3] - 2020-07-03
### Fixed
- Fixed problem with copying files when the destination repo is the same as the source.

## [3.2.2] - 2020-06-13
### Fixed
- Proper handling of spaces in path names.

## [3.2.1] - 2020-04-21
### Fixed
- Fixed an error regarding creation of destination branches.

## [3.2.0] - 2020-04-18
### Added
- Create the destination branch (based on the default branch) if it doesn't exists.

## [3.1.1] - 2020-04-01
### Added
- Add automatic updating of major version tag on release.

## [3.1.0] - 2020-04-01
### Added
- Input variable `commit_message` for using a custom commit message.

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

[Unreleased]: https://github.com/andstor/copycat-action/compare/v3.2.4...HEAD
[3.2.4]: https://github.com/andstor/copycat-action/compare/v3.2.3...v3.2.4
[3.2.3]: https://github.com/andstor/copycat-action/compare/v3.2.2...v3.2.3
[3.2.2]: https://github.com/andstor/copycat-action/compare/v3.2.1...v3.2.2
[3.2.1]: https://github.com/andstor/copycat-action/compare/v3.2.0...v3.2.1
[3.2.0]: https://github.com/andstor/copycat-action/compare/v3.1.1...v3.2.0
[3.1.1]: https://github.com/andstor/copycat-action/compare/v3.1.0...v3.1.1
[3.1.0]: https://github.com/andstor/copycat-action/compare/v3.0.1...v3.1.0
[3.0.1]: https://github.com/andstor/copycat-action/compare/v3.0.0...v3.0.1
[3.0.0]: https://github.com/andstor/copycat-action/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/andstor/copycat-action/compare/v1.1.0...v2.0.0
[1.1.0]: https://github.com/andstor/copycat-action/compare/v1.1.0...v1.0.1
[1.0.1]: https://github.com/andstor/copycat-action/compare/v1.0.1...v1.0.1
[1.0.1]: https://github.com/andstor/copycat-action/compare/v1.0.0...v1.0.1
