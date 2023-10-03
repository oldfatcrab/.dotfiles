# Get timestammp
CURRENT_TIME=$(date '+%Y_%m_%d_%H_%M_%S')

# backup old configuration files
if [ -d $HOME/.oh-my-zsh ]; then cp -r $HOME/.oh-my-zsh "$HOME/.oh-my-zsh_backup_$CURRENT_TIME" && rm -rf $HOME/.oh-my-zsh; fi
if [ -e $HOME/.zshrc ]; then cp $HOME/.zshrc "$HOME/.zshrc_backup_$CURRENT_TIME" && rm $HOME/.zshrc; fi
if [ -e $HOME/.p10k.zsh ]; then cp $HOME/.p10k.zsh "$HOME/.p10k.zsh_backup_$CURRENT_TIME" && rm $HOME/.p10k.zsh; fi
if [ -e $HOME/.gitconfig ]; then cp $HOME/.gitconfig "$HOME/.gitconfig_backup_$CURRENT_TIME" && rm $HOME/.gitconfig; fi

# create symbolic link to dotfiles
ln -s $PWD/submodules/ohmyzsh $HOME/.oh-my-zsh
ln -s $PWD/zsh/zshrc $HOME/.zshrc
ln -s $PWD/zsh/p10k.zsh $HOME/.p10k.zsh

# Brew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file "$PWD/brew/Brewfile"
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> "$(HOME)/.zprofile"
eval "$(/usr/local/bin/brew shellenv)"
eval "$(/usr/local/bin/brew shellenv)"

# gitconfig:"
git config --global core.pager delta
git config --global include.path "$PWD/git/delta.gitconfig"
git config --global color.ui auto

source $HOME/.zshrc
