# Get timestammp
CURRENT_TIME=$(date '+%Y_%m_%d_%H_%M_%S')

# backup old configuration files
if [ -d $HOME/.oh-my-zsh ]; then cp -r $HOME/.oh-my-zsh "$HOME/.oh-my-zsh_backup_$CURRENT_TIME" && rm -rf $HOME/.oh-my-zsh; fi
if [ -e $HOME/.zshrc ]; then cp $HOME/.zshrc "$HOME/.zshrc_backup_$CURRENT_TIME" && rm $HOME/.zshrc; fi
if [ -e $HOME/.p10k.zsh ]; then cp $HOME/.p10k.zsh "$HOME/.p10k.zsh_backup_$CURRENT_TIME" && rm $HOME/.p10k.zsh; fi
if [ -e $HOME/.gitconfig ]; then cp $HOME/.gitconfig "$HOME/.gitconfig_backup_$CURRENT_TIME" && rm $HOME/.gitconfig; fi
if [ -d $HOME/.config/nvim ]; then cp $HOME/.config/nvim "$HOME/.config/nvim_$CURRENT_TIME" && rm -rf $HOME/.config/nvim $HOME/.local/state/nvim $HOME/.local/share/nvim; fi

# create symbolic link to dotfiles
ln -s $PWD/submodules/ohmyzsh $HOME/.oh-my-zsh
ln -s $PWD/submodules/fzf-tab $HOME/.oh-my-zsh/custom/plugins/fzf-tab
ln -s $PWD/submodules/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
ln -s $PWD/zsh/zshrc.zsh $HOME/.zshrc
ln -s $PWD/zsh/p10k.zsh $HOME/.p10k.zsh
mkdir -p $HOME/.config && ln -s $PWD/submodules/NvChad $HOME/.config/nvim

# Brew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file "$PWD/brew/Brewfile"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# gitconfig
git config --global include.path "$PWD/git/core.gitconfig"
git config --global --add include.path "$PWD/git/delta.gitconfig"

source $HOME/.zshrc
