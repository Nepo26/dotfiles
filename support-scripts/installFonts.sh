#!/bin/bash

install_fonts_from_folder() {
  local args=$@
  check_args "install_fonts_from_folder" 1 "${args[@]}"

  local originFolder=$1

  for font in $originFolder/*; do
    fun_log "Installing font '$font' on '~/.fonts'"

    local tempFolder=$(mktemp -d)
    unzip $font -d $tempFolder
    copy_folder_to $tempFolder/fonts/ttf ~/.fonts
  done

  return 0
}
