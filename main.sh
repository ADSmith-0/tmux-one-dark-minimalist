#!/usr/bin/env bash

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

tmux set-option -g status-interval 3
tmux set-option -g status-style "bg=default"
tmux set-window-option -g status-left-length 99
tmux set-window-option -g status-right-length 99
tmux set-window-option -g status-justify centre
# Tmux session
tmux set-window-option -g status-right "#[fg=${session}] #(~/.tmux/plugins/tmux-one-dark-minimalist/plugins/session.sh)  "
# Git branch
tmux set-window-option -g status-left "  #[fg=${git}] #(~/.tmux/plugins/tmux-one-dark-minimalist/plugins/git.sh)"
tmux set-window-option -g window-status-format " #[fg=${flags}]#{?window_flags,#{window_flags},}#[fg=${unselected_fg}]#I:#W "
tmux set-window-option -g window-status-current-format "#[fg=${selected_bg},bg=default]#[fg=${selected_fg},bg=${selected_bg}]#{?window_flags,#{window_flags},}#I:#W#[fg=${selected_bg},bg=default]"
