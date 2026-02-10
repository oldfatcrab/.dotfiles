# Eza (ls replacement)
alias eza='eza --icons'
alias ls='eza'
alias l='eza -lbF --git'
alias lm='eza -lbF --git --sort modified'
alias ll='eza -lbGF --git'
alias la='eza -lbhHigUmuSa --time-style long-iso --git --color-scale'
alias lx='eza -lbhHigUmuSa@ --time-style long-iso --git --color-scale'
alias lS='eza -1 --no-icons'
alias lt='eza --tree --level=2'
alias lT='eza --tree'

# Bat (cat replacement)
alias cat='prettybat --style=full --paging=never -p'
alias less='prettybat --style=full'
alias rg='batgrep --color=auto --paging=never'
alias man=batman
alias watch='batwatch --color=auto'
alias diff='batdiff --color=auto --paging=never'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# Editors
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

# Gemini
alias gemini="gemini_load"
