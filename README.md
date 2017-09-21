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
```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

#Install Vundle for VIM
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

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
<kbd>Cmd</kbd>+<kbd>d</kbd>

### Split Pane Vertically
<kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>d</kbd>

### Move Between Panes
<kbd>Cmd</kbd>+<kbd>[</kbd> to move to the left pane
<kbd>Cmd</kbd>+<kbd>]</kbd> to move to the right pane

### Pane Fullscreen
<kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>d</kbd>

## VIM
### Open File in Nerdtree as a Tab
<kbd>Shift</kbd>+<kbd>t</kbd>

### Toggle Nerdtree tabs
<kbd>g</kbd>+<kbd>t</kbd>

### Open Nerdtree
<kbd>Ctrl</kbd>+<kbd>n</kbd>

### Toggle Nerdtree Focus
<kbd>Ctrl</kbd>+<kbd>w</kbd>+<kbd>w</kbd>

### Find Var/Func Definition/Origin
<kbd>g</kbd>+<kbd>d</kbd>

# TODO:
- [ ] copy ~/.oh-myzsh
- [x] copy ~/.vimrc
- [ ] copy ~/.zshrc
