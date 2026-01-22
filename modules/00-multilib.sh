#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [MULTILIB] $*"
}

log "Enabling multilib repository..."

if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
  sudo sed -i \
    -e '/^\#\[multilib\]/s/^#//' \
    -e '/^\#Include = \/etc\/pacman.d\/mirrorlist/s/^#//' \
    /etc/pacman.conf || {
      log "Failed to modify pacman.conf"
      exit 1
    }
fi

sudo pacman -Syy || {
    log "Failed to update package database"
    exit 1
}

log "Multilib repository enabled successfully"
