# Golson's MacOS ZSH Setup

## Usage 

for lazy ones like me:
```
git clone https://github.com/oldfatcrab/.dotfiles.git $HOME/.dotfiles --recurse-submodules
cd $HOME/.dotfiles
source setup.sh
```
and don't bother with the following...

---

Or if you want to set it up manually and/or make your preferred modification, follow these steps...

## Step 0: Quick setups I recommend everyone should do after getting a new Mac

### Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### iterm2 
```
brew install --cask iterm2
```
or you can choose any terminal you want...

I so want to use [Warp terminal](https://www.warp.dev/) but it
1. still have some minor bugs with [powerlevel10k](https://github.com/dracula/powerlevel10k); and
1. more importantly, not compatible with [fzf](https://github.com/junegunn/fzf) (ctrl-r not working, refer to https://github.com/warpdotdev/warp/issues/149), and their command/file search is far from as good as fzf.
   
If Warp terminal fix above then I will re-consider using it.

### Install MesloLGS Nerd Font
```
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
```
or any [nerd font](https://www.nerdfonts.com/font-downloads) you like.

### Configure iterm2

- Get a colour scheme:
   - Pick a colour scheme [here](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/README.md)
   - or you can download the one I am using ([link](https://github.com/oldfatcrab/.dotfiles/blob/master/iterm2/golson.itermcolors)) - based on the [Dracula](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/README.md#dracula) theme, some modifications have been made so that each colour in the theme is distinguished from others
- In iterm2, press `cmd-comma` to go to preference settings
- In `Profile`, `Colors`, select `Color presets`, import the color scheme and apply the change
- In `Profile`, `Font`, select the nerd font you downloaded, maybe change other font settings

### Install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install powerlevel10k
```
brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> $HOME/.zshrc
source $HOME/.zshrc
```
and finish the configuration.

## Step 1: make an eye-candy-like terminal

### Some prep work
Open `~/.zshrc` and add this line to the top:
```
if [ -z "$HOMEBREW_PREFIX" ]; then export HOMEBREW_PREFIX="$(brew --prefix)"; fi
```

### Command syntax highlighting
Install brew formula
```
brew install zsh-syntax-highlighting
```
add this line to the end of `~/.zshrc` file
```
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### Colourize `ls`
Install brew formula
```
brew install eza
```
add the following aliases to the end of `~/.zshrc` file
```
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
```
Now the `ls` and related shortcut commands become colourful and there will be an icon in front of the file name.

> Tip: if you want to copy the result without icons, add `--no-icons` following the above commands

### Colourize `cat`, `less`, `rg`, `man`, `watch`, `diff` and `--help`
Install brew formula
```
brew install bat bat-extras black chroma clang-format gawk grep prettier pygments shfmt
```
add the following aliases to the end of `~/.zshrc` file
```
## bat
export BAT_THEME=Dracula
alias cat='prettybat --style=full --paging=never -p'
alias less='prettybat --style=full'alias rg='batgrep --color=auto'
alias man=batman
alias watch='batwatch --color=auto'
alias diff='batdiff --color=auto --paging=never'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
```
For above `BAT_THEME`, you can choose one from `bat --list-themes`.

Now the above commands become colourful and prettified, showing line number and git changes. Also the `--help` option is colourized.

> Tip: if you want to copy the result without the line numbers, add `-p` option following the above commands

### Colourize `git diff`

Install brew formula
```
brew install git git-delta
```
Use the following commands to configure git:
```
git config --global core.pager delta
git config --global color.ui auto
git config --global interactive.diffFilter = delta --color-only
git config --global merge.conflictstyle = diff3
git config --global diff.colorMoved default
git config --global delta.navigate true
git config --global delta.features decorations
git config --global delta.dark true
git config --global delta.line-numbers true
git config --global delta.side-by-side true
git config --global delta.syntax-theme Dracula
git config --global delta.true-color always
git config --global delta.zero-style "dim syntax"
```

> Tip: if you want to use `delta` instead of `batdiff` (aliased to be `diff` above) to check diff for files, you can do `delta file_1 file_2`

## Step 2: Setup `fzf` for powerful reverse-command/file search

TBD

## Step 3: Set up `vim` editor

TBD

## Step 4: Set up `tmux`

TBD
