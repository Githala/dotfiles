#!/bin/bash
# This script is used to easilly setup my cli enviroment.
# This includes setting up zsh, tmux and setting all alliases in place.

ZSH=~/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom

# setup git config
./scripts/git.sh

# install zsh and make it the default shell
sudo apt-get -y install zsh

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# set zsh as default shell for current user
chsh -s $(which zsh)

# install spaceship theme for zsh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# fetch .dotfiles and set enable them.
git clone https://github.com/Githala/dotfiles.git /tmp/dotfiles
