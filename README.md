# Installation
## Install iTerm2
* Download iTerm [here](https://www.iterm2.com/downloads.html)
* Launch iTerm2
* Copy/paste iterm/Meslo Slashed/ fonts into your system font directory
* In iTerm2 go to Preferences > Profiles > Text > Font > Change Font and change to:
  * Meslo LG S Regular for Powerline
  * 14 pt font size
* Go to Preferences and check "Load preferences from a custom folder or URL"
* Click "Browse" next to the checkbox above and load the plist in this repo: iterm2/com.googlecode.iterm2.plist

## Install Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Note: might need to install the Homebrew Bundler manually before running the next step. If so, run: `brew tap Homebrew/bundle`

## Install Brew Bundles
This will install NVM, Yarn, Zsh, Zsh Completions, etc
```bash
brew bundle
```

## Copy Bash Profile
```bash
cp .bash_profile ~/.bash_profile
. ~/.bash_profile
```

## Install Oh My ZSH
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

#Install Vundle for VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Configure Tmux
Open vim ~/.tmux.conf and add
```bash
> set -g default-terminal "screen-256color"
```

## Migrate any exports from Bash Profiles to Zshrc
Migrate any exports from ~/.bash_profiles to ~/.zshrc

## Copy Vimrc
```bash
cp .vimrc ~/.vimrc
```

## Install Vundle plugins
```bash
vim +PluginInstall +qall (execute from the terminal. not from inside vim)
```

# Useful Commands
## iTerm2
### Split Pane Horizontally
```bash
Cmd + d
```

### Split Pane Vertically
```bash
Cmd + Shift + d
```

### Move Between Panes
```bash
Command + [
Command + ]
```

### Pane Fullscreen
```bash
Cmd + Shift + Enter
```

## VIM
### Open File in Nerdtree as a Tab
```bash
Shift + t
```

### Toggle Nerdtree tabs
```bash
gt
```

### Open Nerdtree
```bash
Ctrl + n
```

### Toggle Nerdtree Focus
```bash
Ctrl + w + w
```

### Find Var/Func Definition/Origin
```bash
gd
```

# TODO:
- [ ] copy ~/.oh-myzsh
- [x] copy ~/.vimrc
- [ ] copy ~/.zshrc
