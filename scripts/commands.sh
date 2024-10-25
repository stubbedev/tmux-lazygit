#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/utils.sh"

toggle_lazygit_window() {

  if [ -d .git ] && echo .git || git rev-parse --git-dir > /dev/null 2>&1; then
    local lazygit_window_name="lazygit"
    local current_window=$(get_current_window)
    local current_path=$(tmux display-message -p -F "#{pane_current_path}")

    if [ "$current_window" = "$lazygit_window_name" ]; then
      tmux last-window
      return
    fi

    if [ "$(check_if_window_exists "$lazygit_window_name")" -eq 1 ]; then
      tmux select-window -t "$lazygit_window_name"
    else
      tmux new-window -c "$current_path" -n "$lazygit_window_name"
      tmux select-window -t "$lazygit_window_name"
      tmux send-keys -t "$lazygit_window_name" "lazygit" C-m
    fi
  else
    exit 0
  fi
}

if [[ "$1" == "toggle_lazygit_window" ]]; then
	toggle_lazygit_window
fi
