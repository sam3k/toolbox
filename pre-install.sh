#!/bin/sh

# Pre-install will install the necessary libraries
# in order to get iTerm2 up and running. Then we
# we switch to iTerm2.


bold=$(tput bold)
unbold=$(tput sgr0)


install_powerline() {
  # Install Powerline10k Configuration (Must happen before installing Powerline10k)
  if [ ! -f ~/.p10k.zsh ]; then
    echo "${bold}Installing Powerline10k Configuration...${unbold}"
    cp zsh/.p10k.zsh ~/.p10k.zsh
  else
    echo "${bold}Powerline10k configuration already installed.${unbold}"
  fi
}

install_homebrew() {
  # Install Homebrew
  if ! [ -x "$(command -v brew)" ]; then
    echo "${bold}Installing Homebrew...${unbold}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    echo "Homebrew is already installed."
  fi

  # Install Homebrew Bundles
  echo "${bold}Installing Homebrew bundles...${unbold}"
  brew bundle --verbose --file homebrew/Brewfile

  # Install Powerlevel10k manually. Doesn't work in Brewfile
  # powerlevel10k https://github.com/romkatv/powerlevel10k#oh-my-zsh
  brew install romkatv/powerlevel10k/powerlevel10k
  echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
}

start_apps() {
  sleep 5
  # Start VS Code with the Toolbox project open
  code -g ~/Projects/toolbox ~/Projects/toolbox/install.sh --sync on

  ll ~/Library/Application\ Support/iTerm2/DynamicProfiles/
  
  # Start iTerm2 and continue installation there.
  ./iterm2/iterm.sh ~/Projects/toolbox ./install.sh
}

pre_install() {
  install_powerline
  install_homebrew
  start_apps
}

read "brave?Do you want to perform a clean install?"

if [[ "$brave" =~ ^[Yy]$ ]] then
  . ./reset.sh
  pre_install
else
  pre_install
fi
