#!/usr/bin/env bash

kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-replace \
  --key _k_friendly_name "PlasmaShell Replace"
kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-replace \
  --key _launch "plasmashell --replace"
kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-replace \
  --key shortcut "Ctrl+Alt+Backspace"

kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-hard-restart \
  --key _k_friendly_name "PlasmaShell Hard Restart"
kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-hard-restart \
  --key _launch "kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell"
kwriteconfig5 --file kglobalshortcutsrc --group plasmashell-hard-restart \
  --key shortcut "Ctrl+Alt+R"

qdbus org.kde.kglobalaccel /kglobalaccel org.kde.kglobalaccel.reload \
  || qdbus5 org.kde.kglobalaccel /kglobalaccel org.kde.kglobalaccel.reload
