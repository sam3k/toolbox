#!/usr/bin/env bash

# Uninstall all packages installed prior
if [[ ! $TERM_PROGRAM = "Apple_Terminal" ]]; then
  echo 'Please run reset script from Terminal app. (Not iTerm2)'
  return
fi

uninstall() {
  echo "Uninstalling everything..."

  # Uninstall ALL global NPM packages
  echo " ✓ Uninstalling global NPM packages..."
  npm ls -gp --depth=0 | awk -F/ '/node_modules/ && !/\/npm$/ {print $NF}' | xargs npm -g rm

  # Uninstall React Native?
  # todo: npx uninstall react-native?

  # Uninstall VIM
  echo " ✓ Removing VIM home configurations..."
  rm -rf ~/.vim
  rm ~/.vimrc


  # Uninstall Oh-my-ZSH
  echo " ✓ Uninstalling Oh-my-ZSH..."
  # sudo chmod 777 ~/.oh-my-zsh/tools/uninstall.sh
  ~/.oh-my-zsh/tools/uninstall.sh


  # Uninstall iTerm Dynamic Files
  echo " ✓ Removing iTerm2 user profiles"
  rm -rf ~/Library/Application\ Support/iTerm2


  # Uninstall Fonts
  echo " ✓ Removing fonts..."
  rm -rf "~/Library/Fonts/Awesome Terminal Fonts (Patched)"
  rm -rf "~/Library/Fonts/Meslo Slashed"
  rm "~/Library/Fonts/SourceCodePro+Powerline+Awesome+Regular.ttf"
  rm "~/Library/Fonts/SourceCodeVariable-Italic.otf"
  rm "~/Library/Fonts/SourceCodeVariable-Roman.otf"


  # Uninstall Homebrew + Hombrew Packages
  echo " ✓ Uninstalling Homebrew + Homebrew packages..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

  if [ "/usr/local/bin/code" ]; then
    echo "Removing VS Code bin file..."
    # For some reason VS Code is not removed by Homebrew uninstall
    rm /usr/local/bin/code
  fi

  if [ "/Applications/iTerm.app" ]; then
    echo "Removing iTerm2 app from applications folder..."
    rm -rf /Applications/iTerm.app
  fi

  if [ "/Applications/Visual Studio Code.app" ]; then
    echo "Removing VS Code app from applications folder..."
    rm -rf /Applications/Visual\ Studio\ Code.app
  fi
}

read "brave?Are you ready to continue with the setup?"

if [[ "$brave" =~ ^[Yy]$ ]]
then
    uninstall
fi





