if [ -z "$HOMEBREW_PREFIX" ]; then export HOMEBREW_PREFIX="$(brew --prefix)"; fi

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters
