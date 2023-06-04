#!/bin/zsh

# External Functions:
#
# - check_args
# - log

copy_folder_to(){
  local args="$@"
  check_args "copy_folder_to" 2 "${args[@]}"

  local originFolder=$1
  local destFolder=$2

  fun_log "Copying files from '$originFolder' to '$destFolder'"

  mkdir -p $destFolder
  cp -R -v "$originFolder"/* "$destFolder"
  return 0
}
