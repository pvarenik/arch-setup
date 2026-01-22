#!/usr/bin/env bash

# Configuration file for Arch KDE Setup
# This file allows customization of the installation process

# Enable/disable modules
ENABLE_MULTILIB=true
ENABLE_SYSTEM_UPDATE=true
ENABLE_KDE=true
ENABLE_FONTS=true
ENABLE_PACKAGES=true
ENABLE_AUR=true
ENABLE_SERVICES=true
ENABLE_SHORTCUTS=true
ENABLE_FONTCONFIG=true

# Package lists (can be modified to customize installations)
ADDITIONAL_PACKAGES=(
  "telegram-desktop"
  "signal-desktop"
  "steam"
  "syncplay"
  "mpv"
  "vlc"
  "krita"
  "qbittorrent"
  "partitionmanager"
  "pyside6"
  "kdeconnect"
  "cronie"
  "sshpass"
  "rclone"
  "code"
  "timeshift"
)

AUR_PACKAGES=(
  "google-chrome"
  "slack-desktop"
  "input-remapper-git"
  "realvnc-vnc-viewer"
  "zoom"
  "timeshift-autosnap"
  "cuda"
)

# Services to enable
ENABLED_SERVICES=(
  "cronie.service"
  "input-remapper"
)

# KDE shortcuts configuration
KDE_SHORTCUTS=(
  "plasmashell-replace"
  "plasmashell-hard-restart"
)