# Get timestammp
CURRENT_TIME=$(date '+%Y_%m_%d_%H_%M_%S')

# Brew installation
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#brew bundle --file "$PWD/brew/Brewfile"

# backup old configuration files
if [ -d $HOME/.oh-my-zsh ]; then cp -r $HOME/.oh-my-zsh "$HOME/.oh-my-zsh_backup_$CURRENT_TIME" && rm -rf $HOME/.oh-my-zsh; fi
if [ -e $HOME/.zshrc ]; then cp $HOME/.zshrc "$HOME/.zshrc_backup_$CURRENT_TIME" && rm $HOME/.zshrc; fi
if [ -e $HOME/.zshenv ]; then cp $HOME/.zshenv "$HOME/.zshenv_backup_$CURRENT_TIME" && rm $HOME/.zshenv; fi
if [ -e $HOME/.zlogin ]; then cp $HOME/.zlogin "$HOME/.zlogin_backup_$CURRENT_TIME" && rm $HOME/.zlogin; fi
if [ -e $HOME/.zprofile ]; then cp $HOME/.zprofile "$HOME/.zprofile_backup_$CURRENT_TIME" && rm $HOME/.zprofile; fi
if [ -e $HOME/.zlogout ]; then cp $HOME/.zlogout "$HOME/.zlogout_backup_$CURRENT_TIME" && rm $HOME/.zlogout; fi
if [ -e $HOME/.p10k.zsh ]; then cp $HOME/.p10k.zsh "$HOME/.p10k.zsh_backup_$CURRENT_TIME" && rm $HOME/.p10k.zsh; fi
if [ -e $HOME/.gitconfig ]; then cp $HOME/.gitconfig "$HOME/.gitconfig_backup_$CURRENT_TIME" && rm $HOME/.gitconfig; fi

# create symbolic link to dotfiles
ln -s $PWD/submodules/ohmyzsh $HOME/.oh-my-zsh
ln -s $PWD/zsh/zshrc $HOME/.zshrc
ln -s $PWD/zsh/zshenv $HOME/.zshenv
ln -s $PWD/zsh/zlogin $HOME/.zlogin
ln -s $PWD/zsh/zprofile $HOME/.zprofile
ln -s $PWD/zsh/zlogout $HOME/.zlogout
ln -s $PWD/zsh/p10k.zsh $HOME/.p10k.zsh

# gitconfig
git config --global core.pager delta
git config --global include.path "$PWD/git/delta.gitconfig"

source $HOME/.zshrc
