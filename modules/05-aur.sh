#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [AUR] $*"
}

# Install AUR packages if enabled
if [[ "$ENABLE_AUR" == true ]]; then
  log "Installing AUR packages..."
  
  # Install yay if not present
  if ! command -v yay &> /dev/null; then
    log "Installing yay AUR helper..."
    sudo pacman -S --needed --noconfirm git base-devel || {
      log "Failed to install yay dependencies"
      exit 1
    }
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm || {
      log "Failed to install yay"
      exit 1
    }
    cd $SCRIPT_DIR
  fi
  
  # Install AUR packages
  for package in "${AUR_PACKAGES[@]}"; do
    log "Installing $package from AUR..."
    yay -S --noconfirm "$package" || {
      log "Failed to install $package"
      # Continue with other packages instead of exiting
    }
  done
fi

log "AUR packages installed successfully"
