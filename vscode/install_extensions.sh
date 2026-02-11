#!/usr/bin/env bash
# Install VS Code extensions from list
set -e

DOTFILES_DIR="$HOME/.dotfiles"
VSCODE_DIR="$DOTFILES_DIR/vscode"
EXT_LIST="$VSCODE_DIR/extensions.list"

if [ ! -f "$EXT_LIST" ]; then
    echo "No extension list found at $EXT_LIST"
    exit 0
fi

if command -v code >/dev/null 2>&1; then
    echo "Installing VS Code extensions..."
    while read -r extension || [ -n "$extension" ]; do
        if [ -n "$extension" ]; then
            echo "Installing $extension..."
            code --install-extension "$extension" --force
        fi
    done < "$EXT_LIST"
    echo "Extension installation complete."
else
    echo "Error: 'code' command not found. Skipping extension installation."
    exit 1
fi
