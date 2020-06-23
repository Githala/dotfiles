#!/bin/bash
# This script is used to easilly setup my cli enviroment.
# This includes setting up zsh, tmux and setting all alliases in place.

ZSH=~/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom

DF=$(pwd)
DF_OLD=~/.pre_install_configs

if [ ! -f "$DF_OLD" ]; then
  mkdir -p $DF_OLD/.config
fi

link_df () {
  FILE=$HOME/$1
  if [ -e "$FILE" ]; then
    echo "$FILE exists, moving to backup location"
    mv $FILE $DF_OLD/.
  elif [ -L "$FILE" ]; then
    echo "$FILE is a symlink, removing it"
    rm $FILE
  fi
  ln -s $DF/$1 $HOME
}

link_dfc () {
  FILE=$HOME/.config/$1
  if [ -e "$FILE" ]; then
    echo "$FILE exists, moving to backup location"
    mv $FILE $DF_OLD/.config/.
  elif [ -L "$FILE" ]; then
    echo "$FILE is a symlink, removing it"
    rm $FILE
  fi
  ln -s $DF/config/$1 $HOME/.config
}

echo "starting"

link_df .zshrc
link_df .zshrc.d
link_df .tmux.conf

link_dfc terminator
link_dfc rofi
link_dfc polybar
link_dfc bspwm 
link_dfc sxhkd

 
