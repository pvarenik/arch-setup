#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [FONTS] $*"
}

log "Installing fonts..."

sudo pacman -S --needed --noconfirm \
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \
  ttf-dejavu \
  ttf-liberation || {
      log "Failed to install fonts"
      exit 1
  }

log "Updating font cache..."
fc-cache -f -v || {
    log "Failed to update font cache"
    exit 1
}

log "Fonts installed successfully"
