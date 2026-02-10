# Plugins List
plugins=(
  fzf
  fzf-tab
  git
  macos
  sudo
  web-search
  z
  zsh-completions
)

# FZF Tab Configuration
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors "٧(s.:.)LS_COLORS"
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level=2 --icons --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# set minimum height to 50%
zstyle ':fzf-tab:*' fzf-flags '--height=50%'

# Process completion
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps -p $word -o command -w | tail -n +2'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# Systemd status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# File preview
zstyle ':fzf-tab:complete:*:*' fzf-preview 'echo "\033[1m${(Q)group}\033[0m\n"
if [[ "${(Q)group}" == "[file]" ]]; then
  if [[ -n "${(Q)realpath}" ]]; then
    mime=$(file -bL --mime-type "${(Q)realpath}")
    category=${mime%%/*}
    if [[ -d "${(Q)realpath}" ]]; then
      eza --tree --level=2 --icons --color=always "${(Q)realpath}"
    elif [[ "$category" == "text" ]]; then
      prettybat --color=always --style=plain --paging=never "${(Q)realpath}"
    fi
  fi
elif [[ "${(Q)group}" == "[alias]" ]]; then
  echo "${(Q)desc}"
elif [[ "${(Q)group}" =~ "command]$" ]]; then
  which "${(Q)word}"
elif [[ "${(Q)group}" == "[parameter]" ]]; then
  echo "${(P)word}"
fi'

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Syntax Highlighting
if [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Bun Completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
