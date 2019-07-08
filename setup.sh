#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install git, curl, npm
sudo apt-get update
sudo apt-get install curl git nodejs npm

# Update config files
cd ~
curl -O https://raw.githubusercontent.com/kominam/dotfiles/master/.gitconfig
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o ~/.vim/plugins.vim https://raw.githubusercontent.com/kominam/dotfiles/master/.vim/plugins.vim
curl -O https://raw.githubusercontent.com/kominam/dotfiles/master/.vimrc

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
