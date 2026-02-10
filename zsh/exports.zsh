# Homebrew Setup (Cross-platform)
if [ -f "/opt/homebrew/bin/brew" ]; then
    export HOMEBREW_PREFIX="/opt/homebrew"
elif [ -f "/usr/local/bin/brew" ]; then
    export HOMEBREW_PREFIX="/usr/local"
fi

if [ -n "$HOMEBREW_PREFIX" ]; then
    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
    export FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"
fi

# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Environment Variables
export EDITOR='nvim'
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

# Bat
export BAT_THEME="Dracula"

# FZF Configuration
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
