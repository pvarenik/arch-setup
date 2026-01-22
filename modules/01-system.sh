#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [SYSTEM] $*"
}

log "Updating system packages..."

sudo pacman -Syu --noconfirm || {
    log "Failed to update system packages"
    exit 1
}

log "System update completed"
