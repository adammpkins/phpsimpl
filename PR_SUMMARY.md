# PHPSimpl Modernization Contribution

Hey guys, not sure how much this helps you. If the answer is "Not at all," feel free to throw it away, but these changes should be backwards compatible based on my tests, but I could be making incorrect assumptions. Feel free to review and let me know what's useful, if anything.

## Core Migration
- Migrate `lib/db.php` from `mysql_*` to `mysqli_*` for PHP 7+ compatibility
- Add `DB_PORT` support to `Simpl\DB::Connect()` for non-standard database ports
- Use global namespace (`\mysqli_*`) for all mysqli function calls

## PHP 8 Compatibility Fixes
- Add `__construct` shims to `Simpl\File` and `Simpl\Folder` classes (PHP 4-style constructors removed in PHP 8)
- Fix `File::Delete()` method signature to match parent `Folder::Delete($force=false)`

## Bug Fixes
- Fix `Form` class: pass `Validate` instance to `Field` constructor
- Fix `Form` class: add `isset()` checks for optional constructor arrays
- Fix `Validate` class: add missing closing delimiter `/` in phone regex
- Fix `Functions` class: correct reversed array check in `a()` helper (`$array[$index]` instead of `$index[$array]`)

## Testing Infrastructure
- Add Docker multi-environment setup (PHP 5.5 + PHP 8.2 + MariaDB)
- Add PEST test suite with unit tests for DB, Form, Validate, Functions, Session, and File classes
- Add `test-app/` for visual verification in Docker environments
- Add GitHub Actions CI workflow (`.github/workflows/ci.yml`)
- Isolate PHP 5.5 vendor directory to prevent Composer 2 compatibility issues

## Documentation & Scripts
- Add `MIGRATION_STATUS.md` documenting all changes
- Add `TESTING.md`, `MULTI-ENV-TESTING.md`, `MULTI-ENV-README.md`
- Add helper scripts: `serve-php55.sh`, `serve-php82.sh`, `env.sh`, `test-all-environments.sh`
