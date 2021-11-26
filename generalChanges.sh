#!/bin/bash

DOTFILES_LOCATION = $(pwd)

echo "setkbdmap br" >> "/etc/bashrc"

# TODO Check Distribution
# TODO Check if package console-data is installed.

# TODO Check available keyboard maps and select one

# Check 
if [[ -e "/usr/share/keymaps/i386/qwerty/br-abnt2.kmap.gz" ]];then
  # Set terminal keyboard as br-abnt2
  echo "loadkeys br-abnt2" >> "/etc/bashrc"
fi


# Link Dotfiles Location to general default locations
ln -sf "$DOTFILES_LOCATION/.tmux.conf" "/etc/tmux.conf"
ln -sf "$DOTFILES_LOCATION/.vimrc" "/etc/vimrc"


