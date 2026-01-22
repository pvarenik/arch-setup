#!/usr/bin/env bash

sudo tee /etc/fonts/local.conf >/dev/null <<'EOF'
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

fc-cache -f -v
