#!/usr/bin/env bash

if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
  sudo sed -i \
    -e '/^\#\[multilib\]/s/^#//' \
    -e '/^\#Include = \/etc\/pacman.d\/mirrorlist/s/^#//' \
    /etc/pacman.conf
fi

sudo pacman -Syy
