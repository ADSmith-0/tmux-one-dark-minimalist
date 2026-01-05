#!/usr/bin/env bash

# Taken from here: https://stackoverflow.com/a/72068155/6515818
pad() {
  [ "$#" -gt 1 ] && [ -n "$2" ] && printf "%$2.${2#-}s" "$1";
}

# Taken from here: https://github.com/2KAbhishek/tmux2k/blob/main/lib/utils.sh
get_tmux_option() {
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-option -gqv "$option")
    if [ -z "$option_value" ]; then
        echo $default_value
    else
        echo $option_value
    fi
}

max_length=30

tmux_icon=""
git_icon=""

black=$(get_tmux_option "@tmux-one-dark-black" '#282c34')
red=$(get_tmux_option "@tmux-one-dark-red" '#ef596f')
green=$(get_tmux_option "@tmux-one-dark-green" '#89ca78')
yellow=$(get_tmux_option "@tmux-one-dark-yellow" '#e5c07b')
blue=$(get_tmux_option "@tmux-one-dark-blue" '#61afef')
magenta=$(get_tmux_option "@tmux-one-dark-magenta" '#d55fde')
cyan=$(get_tmux_option "@tmux-one-dark-cyan" '#2bbac5')
white=$(get_tmux_option "@tmux-one-dark-white" '#ffffff')

selected_bg=$(get_tmux_option "@tmux-one-dark-selected-bg" "${yellow}")
selected_fg=$(get_tmux_option "@tmux-one-dark-selected-fg" "${black}")
flags=$(get_tmux_option "@tmux-one-dark-flags" "${red}")
unselected_fg=$(get_tmux_option "@tmux-one-dark-unselected-fg" "${white}")
git=$(get_tmux_option "@tmux-one-dark-git" "${green}")
session=$(get_tmux_option "@tmux-one-dark-session" "${cyan}")

get_branch() {
  result=$(git branch --show-current)
  length=$(echo $result | tr -d '\n' | wc -m)
  if [ $length -ge $max_length ]; then
    echo "$git_icon $(echo $result | head -c $(($max_length - 3)))..."
  else
    echo "$(pad "$git_icon $result" -$max_length)"
  fi
}

get_session() {
  result=$(tmux display-message -p '#S')
  length=$(echo $result | tr -d '\n' | wc -m)
  if [ $length -ge $max_length ]; then
    echo "...$(echo $result | tail -c $(($max_length - 3))) $tmux_icon"
  else
    echo "$(pad "$result $tmux_icon" $max_length)"
  fi
}


tmux set-window-option -g status-style "bg=default"
tmux set-window-option -g status-left-length 99
tmux set-window-option -g status-right-length 99
tmux set-window-option -g status-justify centre
# Tmux session
tmux set-window-option -g status-right "#[fg=${session}] $(get_session)  "
# Git branch
tmux set-window-option -g status-left "  #[fg=${git}] $(get_branch)"
tmux set-window-option -g window-status-format " #[fg=${flags}]#{?window_flags,#{window_flags},}#[fg=${unselected_fg}]#I:#W "
tmux set-window-option -g window-status-current-format "#[fg=${selected_bg},bg=default]#[fg=${selected_fg},bg=${selected_bg}]#{?window_flags,#{window_flags},}#I:#W#[fg=${selected_bg},bg=default]"
