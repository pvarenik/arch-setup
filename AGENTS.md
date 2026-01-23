# Arch KDE Setup - AGENTS.md

## Build, Lint, and Test Commands

This repository contains a collection of bash scripts for Arch Linux KDE setup. There are no automated tests or build processes as this is a manual installation script.

* **Running a single module**: `bash modules/00-multilib.sh`
* **Full execution**: `./install.sh`
* **Execute with verbose output**: `./install.sh -v`
* **Skip modules**: `./install.sh -s 01-system,02-kde`
* **Show help**: `./install.sh -h`

## Code Style Guidelines

### Bash Scripting
- Use descriptive function names with lowercase letters and underscores
- All functions should be prefixed with `log()` for consistent messaging
- Use `[[ ]]` for conditionals instead of `[ ]`
- Use `$(...)` for command substitution instead of backticks
- Always quote variables: `"$variable"`
- Add newlines after function definitions and conditionals
- Follow the pattern: `set -e` for error handling, `set -x` for verbose mode when requested
- Use absolute paths for script locations

### File Structure
- All modules are in the `modules/` directory with numeric prefixes for ordering
- Configuration file: `config.sh`
- Main execution script: `install.sh`
- Documentation: `README.md`

### Import/Configuration
- Configuration is handled via `source config.sh` in main install.sh
- Variables defined in config.sh include:
  - ENABLE_* flags for module control
  - Package arrays: ADDITIONAL_PACKAGES, AUR_PACKAGES
  - Service arrays: ENABLED_SERVICES
- Default values are provided in install.sh if config.sh is missing

### Naming Conventions
- Module files: `00-<name>.sh`, `01-<name>.sh`, etc. for execution order
- Function names: `snake_case`
- Variable names: `UPPER_CASE` for configuration, `lower_case` for local variables
- File names: `snake_case`

### Error Handling
- Use `set -e` at the beginning of scripts to exit on error
- Use `|| { log "Error message"; exit 1; }` pattern for command error handling
- Check for required files like `/etc/arch-release` before proceeding
- Handle configuration file existence with defaults

### Logging
- All log messages should use the `log()` function with timestamps
- Prefix log messages with module names: `[MODULE] Message`
- Messages are timestamped for tracking progress

### Git Hooks and Rules
- No specific cursor/copilot rules provided
- Basic gitignore with standard patterns expected

This repository is designed to be run manually by users rather than through CI/CD systems or automated tests.