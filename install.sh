#!/bin/bash
# This script is used to easilly setup my cli enviroment.
# This includes setting up zsh, tmux and setting all alliases in place.

ZSH=~/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom

# setup git config
./scripts/git.sh

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install spaceship theme for zsh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# symlink dotfiles
rm $HOME/.zshrc $HOME/.tmux.conf

DF=$(pwd)
DFC=$DF/config
CONFIG=$HOME/.config
ln -s $DF/.zshrc $HOME
ln -s $DF/.zshrc.d $HOME
ln -s $DF/.tmux.conf $HOME
ln -s $DFC/terminator $CONFIG
ln -s $DFC/rofi $CONFIG
ln -s $DFC/polybar $CONFIG
ln -s $DFC/bpswm $CONFIG
ln -s $DFC/sxhkd $CONFIG

sudo cp bin/* /bin/.

sudo pacman -Sy terminator vim polybar pamac-gtk guake
 
