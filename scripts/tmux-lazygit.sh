#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMANDS_FILE="$CURRENT_DIR/commands.sh"

source "$CURRENT_DIR/utils.sh"

main() {
	tmux set-environment -g TMUX_LAZYGIT_COMMANDS_FILE "$COMMANDS_FILE"
  tmux bind -n M-g run-shell "#{TMUX_LAZYGIT_COMMANDS_FILE} toggle_lazygit_window"
  tmux bind -n M-a run-shell "#{TMUX_LAZYGIT_COMMANDS_FILE} toggle_htop_window"
}

main
