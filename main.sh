#!/usr/bin/env bash

black='#282c34'
red='#ef596f'
green='#89ca78'
yellow='#e5c07b'
blue='#61afef'
magenta='#d55fde'
cyan='#2bbac5'
white='#ffffff'

selected_bg=${yellow}
selected_fg=${black}
flags=${red}
unselected_fg=${white}
git=${green}
session=${cyan}

max_length=20

tmux_icon=""
git_icons=" "

pad() {
  [ "$#" -gt 1 ] && [ -n "$2" ] && printf "%$2.${2#-}s" "$1";
}

get_branch() {
  result=$(git branch --show-current)
  length=$(echo $result | tr -d '\n' | wc -m)
  if [ $length -ge $max_length ]; then
    echo "$git_icons $(echo $result | head -c $(($max_length - 3)))..."
  else
    echo "$git_icons $(pad "$result" -$max_length)"
  fi
}

get_session() {
  result=$(tmux display-message -p '#S')
  length=$(echo $result | tr -d '\n' | wc -m)
  if [ $length -ge $max_length ]; then
    echo "$tmux_icons ...$(echo $result | tail -c $(($max_length - 3)))"
  else
    echo "$(pad "$tmux_icon $result" $max_length)"
  fi
}

# Tmux session
tmux set-window-option -g status-right "#[fg=${session}] $(get_session) "
# Git branch
tmux set-window-option -g status-left " #[fg=${git}]  $(get_branch)"
tmux set-window-option -g window-status-format " #[fg=${flags}]#{?window_flags,#{window_flags},}#[fg=${unselected_fg}]#I:#W "
tmux set-window-option -g window-status-current-format "#[fg=${selected_bg},bg=default]#[fg=${selected_fg},bg=${selected_bg}]#{?window_flags,#{window_flags},}#I:#W#[fg=${selected_bg},bg=default]"
