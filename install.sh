#!/bin/sh

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed."
fi

# Install Homebrew Bundles
echo "Installing Homebrew bundles..."
brew bundle


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


# Configure Zsh
if [ ! -f ~/.zshrc ]; then
  echo "Configuring Zsh...."
  cp zsh/.zshrc ~/.zshrc
else
  echo "~/.zshrc already exists. Copy extra settings in toolbox/tmux/.tmux.conf manually."
fi


# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


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

