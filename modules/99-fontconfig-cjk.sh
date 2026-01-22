#!/usr/bin/env bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [FONTCONFIG] $*"
}

log "Setting up font configuration for CJK characters..."

sudo tee /etc/fonts/local.conf >/dev/null <<'EOF' || {
    log "Failed to write font configuration file"
    exit 1
}

<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

  <match target="pattern">
    <test name="family"><string>sans-serif</string></test>
    <edit name="family" mode="prepend">
      <string>Noto Sans CJK SC</string>
      <string>Noto Sans CJK TC</string>
      <string>Noto Sans CJK JP</string>
      <string>Noto Sans CJK KR</string>
    </edit>
  </match>

  <match target="pattern">
    <test name="family"><string>serif</string></test>
    <edit name="family" mode="prepend">
      <string>Noto Serif CJK SC</string>
      <string>Noto Serif CJK JP</string>
    </edit>
  </match>

  <match target="pattern">
    <test name="family"><string>monospace</string></test>
    <edit name="family" mode="prepend">
      <string>Noto Sans Mono CJK SC</string>
      <string>Noto Sans Mono CJK JP</string>
    </edit>
  </match>

</fontconfig>
EOF

log "Updating font cache..."
fc-cache -f -v || {
    log "Failed to update font cache"
    exit 1
}

log "Font configuration completed successfully"
