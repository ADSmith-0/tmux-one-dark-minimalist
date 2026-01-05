#!/usr/bin/env bash

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$current_dir/../lib/utils.sh"

get_branch() {
  result=$(git branch --show-current)
  length=$(echo $result | tr -d '\n' | wc -m)
  if [ $length -ge $max_length ]; then
    echo "$git_icon $(echo $result | head -c $(($max_length - 3)))..."
  else
    echo "$(pad "$git_icon $result" -$max_length)"
  fi
}

get_branch
