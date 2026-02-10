if [ -z "$HOMEBREW_PREFIX" ]; then export HOMEBREW_PREFIX="$(brew --prefix)"; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

source $ZSH/oh-my-zsh.sh

# User configuration

### bat
export BAT_THEME=Dracula

### fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export FZF_COMPLETION_OPTS='--border --info=inline'

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level=2 --icons --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# set minimum height to 50%
zstyle ':fzf-tab:*' fzf-flags '--height=50%'

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps -p $word -o command -w | tail -n +2'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# show systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# show file contents
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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## exa
### general use
alias eza='eza --icons'
alias ls='eza'                                                         # ls
alias l='eza -lbF --git'                                               # list, size, type, git
alias lm='eza -lbF --git --sort modified'                              # list, modified date sort
alias ll='eza -lbGF --git'                                             # long list
alias la='eza -lbhHigUmuSa --time-style long-iso --git --color-scale'  # all list
alias lx='eza -lbhHigUmuSa@ --time-style long-iso --git --color-scale' # all + extended list
### specialty views
alias lS='eza -1 --no-icons'                                           # one column, just names
alias lt='eza --tree --level=2'                                        # tree
alias lT='eza --tree'                                                  # big tree

## bat
alias cat='prettybat --style=full --paging=never -p'
alias less='prettybat --style=full'
alias rg='batgrep --color=auto --paging=never'
alias man=batman
alias watch='batwatch --color=auto'
alias diff='batdiff --color=auto --paging=never'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

## neovim
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

# source brewed packages
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# powerlevel10k
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# bun completions
[ -s "/Users/oldfatcrab/.bun/_bun" ] && source "/Users/oldfatcrab/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/oldfatcrab/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by Antigravity
export PATH="/Users/oldfatcrab/.antigravity/antigravity/bin:$PATH"

# ==========================================
# FKR Project: Gemini Context Auto-Loader
# ==========================================

function gemini_load() {
    local prompt=""
    local has_context=false

    # 1. try loading GEMINI.md
    if [[ -f "GEMINI.md" ]]; then
        prompt+="[SYSTEM: Load Rules]\n$(cat GEMINI.md)\n\n"
        has_context=true
    fi

    # 2. try loading AGENTS.md
    if [[ -f "AGENTS.md" ]]; then
        prompt+="[SYSTEM: Load Team]\n$(cat AGENTS.md)\n\n"
        has_context=true
    fi

    # 3. try loading SKILLS.md
    if [[ -f "SKILLS.md" ]]; then
        prompt+="[SYSTEM: Load Team]\n$(cat SKILLS.md)\n\n"
        has_context=true
    fi

    # 3. Execution Logic
    if [ "$has_context" = true ]; then
        echo "⚡️ Detected Project Context. Injecting AGENTS & GEMINI..."
        prompt+="[USER TASK: Resume Context]\nWe are resuming development. Please analyze the loaded files and wait for instructions."
        
        # KEY FIX: Use --prompt-interactive (-i) to keep the session open!
        # We append "$@" so you can still pass other flags like --debug if needed
        command gemini --prompt-interactive "$prompt" "$@"
    else
        # No context files? Run as normal interactive CLI
        command gemini "$@"
    fi
}

# Override default command
alias gemini="gemini_load"

