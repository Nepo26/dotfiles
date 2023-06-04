#!/bin/zsh

check_args(){

  local function_name=$1
  # Limit args as number
  local limit_args=$(($2))

  # Receives all arguments after the 'function_name' and 'limit_args' as an array and sets it as a variable
  # comment by 'David Rissato Cruz'
  # https://askubuntu.com/questions/674333/how-to-pass-an-array-as-function-argument
  local -a args=("${@:3}")


  # If Number of arguments is greater than the predefined limit
  args_size=${#args[@]}

  if [ $args_size -gt $limit_args ]; then
    fun_log error "function [$function_name] -> The number of arguments is greater than the predefined limit $function_name \nExpected $limit_args \nReceived $args_size"
    return 1
  fi

  return 0
}
