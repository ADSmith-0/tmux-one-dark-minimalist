#!/usr/bin/env bash

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$current_dir/../lib/utils.sh"

result=$(tmux display-message -p '#S')
length=$(echo $result | tr -d '\n' | wc -m)
if [ $length -ge $max_length ]; then
  echo "...$(echo $result | tail -c $(($max_length - 3))) $tmux_icon"
else
  echo "$(pad "$result $tmux_icon" $max_length)"
fi
