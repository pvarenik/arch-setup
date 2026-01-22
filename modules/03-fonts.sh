#!/usr/bin/env bash

sudo pacman -S --needed --noconfirm \
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \
  ttf-dejavu \
  ttf-liberation

fc-cache -f -v
