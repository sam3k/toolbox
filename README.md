# Installation
This one line script will eventually replace most of the manual install listed right below. 
```bash
./install.sh
```
## Install iTerm2
* Install Xcode first
* Download iTerm [here](https://www.iterm2.com/downloads.html)
* Launch iTerm2
* Copy/paste iterm/Meslo Slashed/ fonts into your system font directory
* In iTerm2 go to Preferences > Profiles > Text > Font > Change Font and change to:
  * SourceCodePro Powerline Awesome Regular
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

## Install Vundle for VIM
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
## Search with FZF (fuzzy finder)
### Toggle Search
<kbd>Ctl</kbd> t

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

## ZSH/OH-MY-ZSH
### find and open file by name anywhere in the tree directory
```bash
vi **/News.js
```

## CD with fuzzy matching
Say that you have the following structure in your current directory: toolbox/iterm/docs.
You can type shorthands and they will get auto completed after pressing <kbd>TAB</kbd>
```bash
cd tool/term/doc
```

## List every file in the current dir or below in a variety of ways
```bash
ls src/**/
ls src/**/*.js
```

## Expand environment variables
This will expand your env var 
```bash
$PATH <kbd>Tab</kbd>
```

## Search and Kill Processes
You can start typing kill and then name of process and Zsh will give you a list of possible
processes to kill and their respective PID. 
```bash
kill nod<kbd>Tab</kbd>
```

## List Help Manual after starting to type a command
Say you wanted to invoke the Help guide for `ls`
```bash
ls -<kbd>Tab</kbd>
```

## List Git shortcuts created by Zsh
```bash
alias | grep git
```

## VIM
Read more about cool stuff we can do in VIM here:
* [https://statico.github.io/vim3.html](Vim after 15 Years)

### Search for files using Fizz Fuzz Finder (fzf)
<kbd>,t</kbd>
This will open up the search at the bottom of the screen. Simply start searching.

### Search buffers (files currently loaded in memory)
<kbd>;</kbd>
This will open up the search at the bottom of the screen. Simply start searching.

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

## Bashmarks' Directory Bookmarks
Please note that you need to make sure bashmarks.sh has been patch with the local copy of
bashmarks.sh which adds two new functions: `_d` and `bashmarks` as there were name
collisions when used within oh-my-zsh

### print bashmarks help/options
```bash
bashmarks
```

### Save a New Directory
```bash
cd /directory/to/bookmark/my_project
s my_proj
```

### Go to Bookmark Directory
```bash
g my_proj
```

### Show Directory Path to a Bookmark Name
```bash
p my_proj
```

### List Bookmarks
```bash
_l
```

### Delete Bookmark
```bash
_d my_proj
```


# TODO:
- [ ] copy ~/.oh-myzsh
- [x] copy ~/.vimrc
- [ ] copy ~/.zshrc
