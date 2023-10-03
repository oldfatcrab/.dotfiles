# Brew installations

# TODO: should create backup
rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.z* 

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
