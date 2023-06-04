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
    starship
    fzf
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
fun_log "Copying tmux conf"
cp "$DOTFILES_LOCATION/home/$TMUX_CONF" ~/$TMUX_CONF

fun_log "Copying vim conf"
cp "$DOTFILES_LOCATION/home/$VIM_CONF" ~/$VIM_CONF

fun_log "Copying zsh conf"
cp "$DOTFILES_LOCATION/home/$ZSH_CONF" ~/$ZSH_CONF


fun_log "Copying Starship conf"
cp "$DOTFILES_LOCATION/config/starship/starship.toml" ~/.config/starship.toml

# Add extra config besides the default template on VIM
cat "$DOTFILES_LOCATION/home/$EXTRA_VIM_CONF" >> ~/$VIM_CONF



#################### --------------- Copying MISC Files --------------- ####################
# Binaries
fun_log "Installing builtin binaries"
copy_folder_to $DOTFILES_LOCATION/misc/bin ~/.local/bin

# AsciiArt for colorscript
copy_folder_to $DOTFILES_LOCATION/misc/asciiart ~/.local/share/asciiart



#################### --------------- Install Fonts --------------- ####################
install_fonts_from_folder $DOTFILES_LOCATION/misc/fonts


# INSTALL ZSH PLUGINS
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

