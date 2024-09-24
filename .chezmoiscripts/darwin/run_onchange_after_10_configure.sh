#!/bin/bash

set -euxo pipefail

# Dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false

# Keyboard, mouse, trackpad
defaults write ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
