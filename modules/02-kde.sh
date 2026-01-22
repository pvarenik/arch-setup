#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [KDE] $*"
}

log "Installing KDE Plasma desktop environment..."

sudo pacman -S --needed --noconfirm \
  plasma-meta \
  kde-applications-meta \
  pipewire \
  wireplumber || {
      log "Failed to install KDE packages"
      exit 1
  }

log "KDE Plasma desktop environment installed successfully"