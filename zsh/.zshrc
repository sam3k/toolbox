# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# force username of OS on powerline
export DEFAULT_USER=$(whoami)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH=/Users/$DEFAULT_USER/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Activate Powerlevel10k
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search osx)

source $ZSH/oh-my-zsh.sh
# User configuration


# settings that used to be in ~/.bash_profile
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

alias o="open ."                                  # oh-my-zsh > plugin > osx > open in Finder  =_)
alias ll='ls -laGf'
alias top="vtop --theme acid"
alias oldtop="/usr/bin/top"
alias vinstall="vim +PluginInstall +qall"
alias p="cd ~/Projects"
alias t="cd ~/Projects/toolbox"


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
