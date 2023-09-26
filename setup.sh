rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.z* 

# create symbolic link to dotfiles
ln -s $(pwd)/ohmyzsh $HOME/.oh-my-zsh
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/zshenv $HOME/.zshenv
ln -s $(pwd)/zlogin $HOME/.zlogin
ln -s $(pwd)/zprofile $HOME/.zprofile
ln -s $(pwd)/zlogout $HOME/.zlogout

source $HOME/.zshrc
