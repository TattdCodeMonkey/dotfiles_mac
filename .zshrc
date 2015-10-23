# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# z
. /usr/local/Cellar/z/1.8/etc/profile.d/z.sh 

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"

plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/rcntn83/.rvm/gems/ruby-1.9.3-p484/bin:/Users/rcntn83/.rvm/gems/ruby-1.9.3-p484@global/bin:/Users/rcntn83/.rvm/rubies/ruby-1.9.3-p484/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/Cellar/dfu-util/0.7/bin:/opt/X11/bin:/opt/local/bin:/opt/local/sbin:/Users/rcntn83/.rvm/bin"

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

##########################################################
# Docker 
##########################################################
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/rnorris/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1 

##########################################################
# Atom 
##########################################################
alias atom="atom ."

##########################################################
# Mix / Elixir 
##########################################################
alias mxt='mix test'
alias mxc='mix compile'
alias mxr='iex -S mix'
alias mxd='mix deps.get'
alias mxdg='mix deps.compile'

##########################################################
# Vagrant bits
##########################################################
alias vup="vagrant up --no-provision"
alias vupp="vagrant up"
alias vhalt="vagrant halt"
alias vsuspend="vagrant suspend"
alias vresume="vagrant resume"
alias vreload="vagrant reload"
alias vssh="vagrant ssh"
alias vstat="vagrant status"

##########################################################
# Git bits
##########################################################
alias gstat="git status"
alias gadd="git add"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcm="git add -A && git commit -m"

##########################################################
# Misc. bits
##########################################################
alias clr="clear"

