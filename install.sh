#!/bin/sh

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed."
fi


# Install Homebrew Bundle
echo "Installing Homebrew Bundle..."
brew tap Homebrew/bundle


# Install Homebrew Bundles
echo "Installing Homebrew bundles..."
brew bundle


# Configure iTerm2
echo "Configuring iTerm2..."
defaults delete com.googlecode.iterm2
cp iterm/com.googlecode.iterm2.plist ~/Library/Preferences/
defaults read -app iTerm


# Copy bash profile if none found
if [ ! -f ~/.bash_profile ]; then
  echo "Creating Bash profile..."
  cp .bash_profile ~/.bash_profile
  . ~/.bash_profile
else
  echo "Bash profile already exists. Copy extra settings in toolbox/.bash_profile manually."
fi


# Configure Tmux
if [ ! -f ~/.tmux.conf ]; then
  echo "Configuring Tmux...."
  cp tmux/.tmux.conf ~/.tmux.conf
else
  echo "~/.tmux.conf already exists. Copy extra settings in toolbox/tmux/.tmux.conf manually."
fi


# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


# Install Powerline Theme
echo "Installing Powerline Theme..."
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


# Configure Zsh
if [ ! -f ~/.zshrc ]; then
  echo "Configuring Zsh...."
  cp zsh/.zshrc ~/.zshrc
else
  echo "~/.zshrc already exists. Copy extra settings in toolbox/tmux/.tmux.conf manually."
fi


# Configure Vim
if [ ! -f ~/.vimrc ]; then
  echo "Configuring Vim...."
  cp vim/.vimrc ~/.vimrc
else
  echo "~/.vimrc already exists. Copy extra settings in toolbox/tmux/.tmux.conf manually."
fi


# Install Vim Vundle (VIM Package Manager)
echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


# Install Vtop
echo "Installing Vtop..."
yarn global add vtop


# Install PM2
echo "Installing PM2..."
yarn global add pm2@latest

# Mac Configurations (Optional)
## Change Home/End keys to emulate IBM keyboard. [ref: https://tinyurl.com/ybqfobm2]
if [ ! -f ~/Library/KeyBindings/DefaultKeyBinding.dict ]; then
  echo "Modifying Mac Default Keyboard Bindings..."
  cp os/KeyBindings/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
else
  echo "DefaultKeyBinding.dict already exists. Copy extra settings in toolbox/os/DefaultKeyBinding.dict manually."
fi


# Fuzzy search plugin "fzf"
# To install useful key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install
