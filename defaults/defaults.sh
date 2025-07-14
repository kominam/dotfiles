#!/usr/bin/env bash

# Set the Dock orientation to the left side of the screen and auto hide it
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "autohide" -bool true
defaults write com.apple.dock "tilesize" -int "39"
killall Dock
