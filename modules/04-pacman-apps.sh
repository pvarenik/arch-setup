#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [PACKAGES] $*"
}

log "Installing additional packages via pacman..."

# Install additional packages if enabled
if [[ "$ENABLE_PACKAGES" == true ]]; then
  log "Installing additional packages..."
  sudo pacman -S --needed --noconfirm "${ADDITIONAL_PACKAGES[@]}" || {
      log "Failed to install packages"
      exit 1
  }
fi

log "Additional packages installed successfully"
