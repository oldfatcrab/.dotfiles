# Brew installations

# TODO: should create backup
rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.z* 

# create symbolic link to dotfiles
ln -s $PWD/ohmyzsh $HOME/.oh-my-zsh
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/zshenv $HOME/.zshenv
ln -s $PWD/zlogin $HOME/.zlogin
ln -s $PWD/zprofile $HOME/.zprofile
ln -s $PWD/zlogout $HOME/.zlogout
ln -s $PWD/p10k.zsh $HOME/.p10k.zsh

# gitconfig
git config --global core.pager delta
git config --global include.path "$PWD/delta.gitconfig"

source $HOME/.zshrc
