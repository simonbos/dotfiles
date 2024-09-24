#!/bin/bash

set -euxo pipefail

sudo pacman -S --needed \
    'bat' \
    'bottom' \
    'direnv' \
    'eza' \
    'fd' \
    'fish' \
    'fzf' \
    'git-delta' \
    'git-lfs' \
    'less' \
    'neovim' \
    'ripgrep' \
    'starship' \
    'vivid' \
    'zoxide' \
    'ttf-jetbrains-mono' \
    'ttf-nerd-fonts-symbols' \
    'kitty'
sudo -k
