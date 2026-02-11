#!/usr/bin/env bash
# Snapshot VS Code extensions list
set -e

DOTFILES_DIR="$HOME/.dotfiles"
VSCODE_DIR="$DOTFILES_DIR/vscode"
EXT_LIST="$VSCODE_DIR/extensions.list"

mkdir -p "$VSCODE_DIR"

if command -v code >/dev/null 2>&1; then
    echo "Capturing VS Code extensions..."
    code --list-extensions > "$EXT_LIST"
    echo "Snapshot saved to $EXT_LIST ($(wc -l < "$EXT_LIST" | xargs) extensions found)"
else
    echo "Error: 'code' command not found. Ensure VS Code is in your PATH."
    exit 1
fi
