#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install git, curl, node, npm
sudo apt-get update
sudo apt-get install -y curl git

# Update config files
cd ~
curl -O https://raw.githubusercontent.com/kominam/dotfiles/master/.gitconfig
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o ~/.vim/plugins.vim https://raw.githubusercontent.com/kominam/dotfiles/master/.vim/plugins.vim
curl -O https://raw.githubusercontent.com/kominam/dotfiles/master/.vimrc

# Create symbolic link for neovim
mkdir -p $HOME/.config/nvim/
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo ln -sf $(pwd)/.vimrc $HOME/.vimrc
sudo ln -sf $(pwd)/.vim/plugins.vim $HOME/.config/nvim/plugins.vim
sudo ln -sf $(pwd)/.vimrc $HOME/.config/nvim/init.vim

# Install Ripgrep (rg)
sudo apt-get install ripgrep

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose
