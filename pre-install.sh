#!/bin/sh

# Pre-install will install the necessary libraries
# in order to get iTerm2 up and running. Then we
# we switch to iTerm2.


bold=$(tput bold)
unbold=$(tput sgr0)

# Install Powerline10k Configuration (Must happen before installing Powerline10k)
if [ ! ~/.p10k.zsh ]; then
  echo "${bold}Installing Powerline10k Configuration...${unbold}"
  cp zsh/.p10k.zsh ~/.p10k.zsh
else
  echo "${bold}Powerline10k configuration already installed.${unbold}"
fi

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

# iTerm2 is now ready for usage. Continue installation there.
./iterm2/iterm.sh ~/Projects/toolbox ./install.sh
