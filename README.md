# Arch Linux KDE Setup

This repository contains a collection of scripts to automate the installation and configuration of a KDE desktop environment on Arch Linux.

## Features

- Multi-lib support
- KDE desktop environment
- Package management with pacman and AUR
- System services configuration
- Font configuration
- Customizable package lists

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/arch-setup.git
   cd arch-setup
   ```

2. Customize your package lists by editing `config.sh`:
   ```bash
   nano config.sh
   ```

3. Run the installation script:
   ```bash
   ./install.sh
   ```

## Configuration

The `config.sh` file allows you to customize which packages are installed:
- `ENABLE_PACKAGES` - Enable/disable installation of pacman packages
- `ADDITIONAL_PACKAGES` - List of additional packages to install via pacman
- `ENABLE_AUR` - Enable/disable installation of AUR packages
- `AUR_PACKAGES` - List of AUR packages to install via yay
- `ENABLE_SERVICES` - Enable/disable enabling of services
- `ENABLED_SERVICES` - List of services to enable

## Modules

The setup process is divided into modules:
- `00-multilib.sh` - Enable multilib repository
- `01-system.sh` - System updates and basic configuration
- `02-kde.sh` - KDE desktop installation
- `03-fonts.sh` - Font configuration
- `04-pacman-apps.sh` - Installation of additional packages via pacman
- `05-aur.sh` - Installation of packages via AUR (yay)
- `06-services.sh` - Enabling system services
- `07-kde-shortcuts.sh` - KDE keyboard shortcuts
- `99-fontconfig-cjk.sh` - Fontconfig for CJK characters

## Options

- `-h, --help` - Show help message
- `-v, --verbose` - Enable verbose output
- `-s, --skip MODULES` - Skip specific modules (comma-separated, e.g., `01-system,02-kde`)

## Requirements

- Arch Linux system
- Internet connection
- User with sudo privileges (script should not be run as root)