#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [KDE-SHORTCUTS] $*"
}

log "Configuring KDE global shortcuts..."

kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-replace \
  --key _k_friendly_name "PlasmaShell Replace"
kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-replace \
  --key _launch "plasmashell --replace"
kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-replace \
  --key shortcut "Ctrl+Alt+Backspace" || {
      log "Failed to configure first shortcut"
      exit 1
  }

kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-hard-restart \
  --key _k_friendly_name "PlasmaShell Hard Restart"
kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-hard-restart \
  --key _launch "kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell"
kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-hard-restart \
  --key shortcut "Ctrl+Alt+R" || {
      log "Failed to configure second shortcut"
      exit 1
  }

# Reload the shortcuts
qdbus org.kde.kglobalaccel /kglobalaccel org.kde.kglobalaccel.reload \
  || qdbus5 org.kde.kglobalaccel /kglobalaccel org.kde.kglobalaccel.reload || {
      log "Failed to reload KDE shortcuts"
      exit 1
  }

log "KDE global shortcuts configured successfully"
