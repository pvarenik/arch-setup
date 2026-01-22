#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [SERVICES] $*"
}

# Enable services if enabled
if [[ "$ENABLE_SERVICES" == true ]]; then
  log "Enabling system services..."
  
  for service in "${ENABLED_SERVICES[@]}"; do
    log "Enabling $service..."
    sudo systemctl enable "$service" || {
      log "Failed to enable $service"
      # Continue with other services instead of exiting
    }
  done
fi

log "Services enabled successfully"
