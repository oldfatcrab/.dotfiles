# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Determine configuration directory (where this file resides)
# ${(%):-%x} gives the source file path
# :A resolves symlinks to absolute path
# :h gives the directory
ZSH_CONFIG_DIR=${${(%):-%x}:A:h}

# Fallback if detection fails (e.g. if sourced directly from stdin)
if [[ -z "$ZSH_CONFIG_DIR" || "$ZSH_CONFIG_DIR" == "." ]]; then
    ZSH_CONFIG_DIR="$HOME/.dotfiles/zsh"
fi

# Load Modular Configuration
source "$ZSH_CONFIG_DIR/exports.zsh"
source "$ZSH_CONFIG_DIR/functions.zsh"
source "$ZSH_CONFIG_DIR/plugins.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"

# Powerlevel10k Theme
if [ -f "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme" ]; then
    source "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Docker Desktop Completions
if [ -d "$HOME/.docker/completions" ]; then
    fpath=($HOME/.docker/completions $fpath)
    autoload -Uz compinit
    compinit
fi
