#!/bin/sh

bold=$(tput bold)
unbold=$(tput sgr0)


set_fonts() {
  # Copy Fonts
  echo "${bold}Copying fonts...${unbold}"
  cp -r fonts/. ~/Library/Fonts/
}

# Function to set iTerm "Default" Profile.
# Same as going to Preferences > Profiles > Colors > Colors Presets
# https://coderwall.com/p/s-2_nw/change-iterm2-color-profile-from-the-cli
set_iterm_theme() {
  echo -e "\033]50;SetProfile=$1\a"
}

install_ohmyzsh() {
  # Install Oh-My-Zsh
  if [ ! -d "~/.oh-my-zsh" ]; then
    echo "${bold}Installing Oh-My-Zsh...${unbold}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc

    source ~/.zshrc
  else
    echo "Oh My ZSH is already installed."
  fi
}

install_node() {
  # Install Node
  if ! [ -x "$(command -v npm)" ]; then
    echo "${bold}Installing Node... (Untested)${unbold}"
    nvm install node
  else
    echo "Node already installed"
  fi
}

install_react_native() {
  # Install React Native CLI
  echo "${bold}Installing React Native CLI${unbold}"
  npx react-native
}

install_vtop() {
  if ! [ -x "$(command -v vtop)" ]; then
    echo "${bold}Installing Vtop...${unbold}"
    npm install -g vtop
  else
    echo "Vtop already installed"
  fi
}

install_pm2() {
  echo "${bold}Installing PM2...${unbold}"
  npm install -g pm2@latest
}

install_fzf() {
  # To install useful key bindings and fuzzy completion
  echo "${bold}Configure fzf plugin${unbold}"
  $(brew --prefix)/opt/fzf/install
}

configure_iterm2() {
  # Set iTerm2 Color Palette to Solarized
  if [[ $TERM_PROGRAM = "iTerm.app" ]]; then
    echo "${bold}Setting Solarized theme on iTerm2...${unbold}"

    # Copy "ALL" profiles JSON to Dynamic profiles
    # If I ever want to update the "ANY" profile, go to Profiles > Actions > Export ALL Profiles
    # Ref: https://stackoverflow.com/a/56821180
    cp iterm2/sam3k-profiles.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/

    # Execute profiles "sam3k". sam3k is the "Name" in sam3k-profiles.json
    sleep 5
    ll ~/Library/Application\ Support/iTerm2/DynamicProfiles/
    set_iterm_theme Sam3k
  else
    echo "iTerm not detected"
  fi
}

configure_zsh() {
  # Fix ZSH folder permissions
  chmod 755 /usr/local/share/zsh
  chmod 755 /usr/local/share/zsh/site-functions

  # Configure Zsh
  if [ ! -f ~/.zshrc ]; then
    echo "${bold}Configuring Zsh....${unbold}"
    chsh -s /bin/zsh
    cp zsh/.zshrc ~/.zshrc
    source ~/.zshrc
  else
    echo "~/.zshrc already exists. Copy extra settings in toolbox/tmux/.tmux.conf manually."
  fi
}

configure_vim() {
  # Configure Vim
  if [ ! -f ~/.vimrc ]; then
    echo "${bold}Configuring Vim....${unbold}"
    cp vim/.vimrc ~/.vimrc
  else
    echo "~/.vimrc already exists."
  fi

  # If .vim folder does not exist, create it
  if [ ! -f ~/.vim ]; then
    echo "${bold}Create Vim folder...${unbold}"
    mkdir ~/.vim
  else
    echo "Vim folder already exist."
  fi

  # If .vim folder does not have a colors folder, create it so we can paste the solarized theme
  if [ ! -f ~/.vim/colors ]; then
    echo "${bold}Create Vim colors folder...${unbold}"
    mkdir ~/.vim/colors
  else
    echo "Vim colors folder already exist."
  fi


  # Move solarized theme for Vim into the .vim/colors folder
  cp vim/solarized.vim ~/.vim/colors/


  # Install Vim Vundle (VIM Package Manager)
  if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
    echo "${bold}Vundle.vim doesn't exist. Creating...${unbold}"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  else
    echo "Vundle.vim already exist. Skipping."
  fi


  echo "${bold}Installing Vundle...${unbold}"
  vim +PluginInstall +qall
}



set_fonts
configure_iterm2
configure_zsh
configure_vim
install_ohmyzsh
install_node
install_react_native
install_vtop
install_pm2
install_fzf


echo "${bold}Finished Installation${unbold}"
brew info nvm

# Restart to load ZSH
zsh


# Changed to using VS Code > Settings Sync: https://code.visualstudio.com/docs/editor/settings-sync
# Todo: figure out how to have settings sync enable automatically
# code --list-extensions | xargs -L 1 echo code --install-extension
# https://stackoverflow.com/quest ions/35368889/how-to-export-settings/64035356#64035356
# if ! [ -x "$(command -v code)" ]; then
#   echo "${bold}Installing VS Code extensions...${unbold}"
#   code --install-extension ms-vscode.cpptools
# else
#   echo "Could not install VS Code extensions. Did VS Code install properly?"
# fi


# Configure iTerm2
# echo "${bold}Configuring iTerm2...${unbold}"
# defaults delete com.googlecode.iterm2
# cp iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/
# defaults read -app iTerm


# Copy bash profile if none found
# if [ ! -f ~/.bash_profile ]; then
#   echo "Creating Bash profile..."
#   cp .bash_profile ~/.bash_profile
#   . ~/.bash_profile
# else
#   echo "Bash profile already exists. Copy extra settings in toolbox/.bash_profile manually."
# fi


# Configure Tmux
# if [ ! -f ~/.tmux.conf ]; then
#   echo "${bold}Configuring Tmux....${unbold}"
#   cp tmux/.tmux.conf ~/.tmux.conf
# else
#   echo "~/.tmux.conf already exists. Copy extra settings in toolbox/tmux/.tmux.conf manually."
# fi


# Mac Configurations (Optional)
## Change Home/End keys to emulate IBM keyboard. [ref: https://tinyurl.com/ybqfobm2]
# if [ ! -f ~/Library/KeyBindings/DefaultKeyBinding.dict ]; then
  # echo "Modifying Mac Default Keyboard Bindings..."
  # cp os/KeyBindings/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
# else
  # echo "DefaultKeyBinding.dict already exists. Copy extra settings in toolbox/os/DefaultKeyBinding.dict manually."
# fi
