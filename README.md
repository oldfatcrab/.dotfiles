# Golson's MacOS ZSH Setup

Usage for lazy ones like me:
```
git clone https://github.com/oldfatcrab/.dotfiles.git $HOME
cd $HOME
source setup.sh
```

Or if you want to set it up manually and/or make your preferred modification, follow these steps...

## Step 0: Things I recommend everyone should do after getting a new Mac

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
1. more importantly, not compatible with [fzf](https://github.com/junegunn/fzf) (ctrl-r not working, refer to https://github.com/warpdotdev/warp/issues/149), and there command/file search is far from as good as fzf.
   
If Warp terminal fix above then I will re-consider using it.

### Install MesloLGS Nerd Font
```
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
```
or any [nerd font](https://www.nerdfonts.com/font-downloads) you like.

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

