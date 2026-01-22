#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for module in "$SCRIPT_DIR"/modules/*.sh; do
  echo
  echo "==> Running $(basename "$module")"
  bash "$module"
done

echo
echo "==> Arch KDE setup completed successfully!"
