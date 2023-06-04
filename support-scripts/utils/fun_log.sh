#!/bin/zsh

CRE=$(tput setaf 1)  # Color Red
CYE=$(tput setaf 3)  # Color Yellow
CGR=$(tput setaf 2)  # Color Green
CBL=$(tput setaf 4)  # Color Blue
BLD=$(tput bold)     # Set as bold
CNC=$(tput sgr0)     # Reset formatting

fun_log(){

  local logType="$1"
  local text="${2:-$1}"


  case "$logType" in
    error)
      printf "%s%s$text%s\n" "${BLD}" "${CRE}" "${CNC}"
      ;;
    *)
      printf "%s%s$text%s\n" "${BLD}" "${CGR}" "${CNC}"
      ;;
  esac

  return 0
}

