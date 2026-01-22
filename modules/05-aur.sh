#!/usr/bin/env bash

if ! command -v yay &>/dev/null; then
  sudo pacman -S --needed --noconfirm base-devel git
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi

yay -S --needed --noconfirm \
  google-chrome \
  slack-desktop \
  input-remapper-git \
  realvnc-vnc-viewer \
  zoom \
  timeshift-autosnap \
  cuda
