# Changelog

## [0.2.1] - 2026-03-18

### Fixed
- Added `logger` gem as runtime dependency for Ruby 4.0 compatibility (removed from default gems)

## [0.2.0] - 2026-03-15

### Added
- Standalone `Client` class including all runner modules
- `run_multiple` alias for `run_mulitple` (typo preserved for backward compat)
- Runner and client specs

### Fixed
- `opts.key(:timeout)` -> `opts.key?(:timeout)` in Helpers::Connection (was calling wrong Hash method)

## [0.1.1] - 2026-03-13

### Added
- Initial release
