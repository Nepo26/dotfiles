#!/bin/bash
#
#   _____         __    ___ __ __
#  |     \.-----.|  |_.'  _|__|  |.-----.-----.
#  |  --  |  _  ||   _|   _|  |  ||  -__|__ --|
#  |_____/|_____||____|__| |__|__||_____|_____|
#
# Script to setup my dotfiles
# Author: Nepo26
#   url: https://github.com/Nepo26/dotfiles

# TODO Check Distribution
# TODO Check if package console-data is installed.
# TODO Check available keyboard maps and select one

#################### --------------- Default Variables --------------- ####################
DOTFILES_LOCATION=$(pwd)
TMUX_CONF=".tmux.conf"
VIM_CONF=".vimrc"
EXTRA_VIM_CONF=".vimrc-extra"
ZSH_CONF=".zshrc"


DEPENDENCIES=(
    colorscript
    zsh
    bat
    krew
    kubectl
    lsd
)

#################### --------------- Source Scripts and Utils --------------- ####################

### Utils
source $DOTFILES_LOCATION/support-scripts/utils/fun_log.sh
source $DOTFILES_LOCATION/support-scripts/utils/check_args.sh
source $DOTFILES_LOCATION/support-scripts/utils/copy_folder_to.sh

### Scripts
source $DOTFILES_LOCATION/support-scripts/installFonts.sh



#################### --------------- Link Dotfiles Location to general default locations --------------- ####################

cp "$DOTFILES_LOCATION/home/$TMUX_CONF" ~/$TMUX_CONF
cp "$DOTFILES_LOCATION/home/$VIM_CONF" ~/$VIM_CONF
cp "$DOTFILES_LOCATION/home/$ZSH_CONF" ~/$ZSH_CONF

# Add extra config besides the default template on VIM
cat "$DOTFILES_LOCATION/home/$EXTRA_VIM_CONF" >> ~/$VIM_CONF



#################### --------------- Copying MISC Files --------------- ####################
# Binaries
copy_folder_to $DOTFILES_LOCATION/misc/bin ~/.local/bin

# AsciiArt for colorscript
copy_folder_to $DOTFILES_LOCATION/misc/asciiart ~/.local/share/asciiart



#################### --------------- Install Fonts --------------- ####################
install_fonts_from_folder $DOTFILES_LOCATION/misc/fonts



