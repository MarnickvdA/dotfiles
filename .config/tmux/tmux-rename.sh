#!/bin/bash

# Get the active tmux pane's process ID
pane_pid=$(tmux display-message -p "#{pane_pid}")

# Get the real foreground process (removes leading '-' from login shells)
if command -v pstree &> /dev/null; then
    # Use pstree (best for Linux)
    current_command=$(pstree -lp "$pane_pid" | awk -F'---' '{print $NF}' | awk -F'(' '{print $1}' | sed 's/^-//')
else
    # Use ps (macOS & Linux compatible)
    current_command=$(ps -axo ppid,pid,comm | awk -v ppid=$pane_pid '$1 == ppid {print $3}' | tail -n 1 | sed 's/^-//')
fi

# Fallback if no process is found
[ -z "$current_command" ] && current_command="shell"

case "$current_command" in
    nvim) icon="" ;;    # Vim / Neovim
    vim) icon="" ;;
    zsh|bash|fish) icon="" ;;  # Shell
    node) icon="" ;;   # Node.js
    python) icon="" ;; # Python
    ssh) icon="" ;;   # SSH
    git) icon="" ;;   # Git
    docker) icon="" ;; # Docker
    htop) icon="" ;;   # Htop
    ranger) icon="" ;; # Ranger file manager
    lf) icon="" ;; # lf file manager
    *) icon="" ;;      # Default: terminal
esac

tmux rename-window "$icon $current_command"

