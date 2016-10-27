#Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# z
. /usr/local/Cellar/z/1.8/etc/profile.d/z.sh 

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# virtualenv
export WORKON_HOME=~/.virtualenvssource 
source /usr/local/bin/virtualenvwrapper.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/local/Cellar/dfu-util/0.7/bin:/opt/X11/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin"

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

##########################################################
# Local Emma paths
##########################################################
export LOCALEMMA_EMMA_BASE_DIR=$HOME/dev/emma/
export LOCALEMMA_EMMADMIN_BASE_DIR=$HOME/dev/emmadmin/
export LOCALEMMA_AUDIENCE_BASE_DIR=$HOME/dev/

##########################################################
# mysql aliases
##########################################################
alias start_mysql='sudo /usr/local/mysql/bin/mysqld_safe &'
alias stop_mysql='sudo /usr/local/mysql/bin/mysqladmin shutdown'

##########################################################
# Docker 
##########################################################
#export DOCKER_HOST=tcp://192.168.99.100:2376
#export DOCKER_CERT_PATH=/Users/rnorris/.docker/machine/machines/dinghy
#export DOCKER_TLS_VERIFY=1
#export DOCKER_MACHINE_NAME=dinghy
eval $(dinghy shellinit)

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
alias gca="git commit --amend"
alias gpo="git push --set-upstream origin"

alias gcstale="git branch -a --merged | grep -v 'remotes/' | grep -v '\*' | grep -v master | wc -l"
alias grmstale="git branch -a --merged | grep -v 'remotes/' | grep -v '\*' | grep -v master | xargs git branch -D"

##########################################################
# Misc. bits
##########################################################
alias clr="clear"
alias cleanpyc='find . -type f -name "*.pyc" -delete'
alias yolo="rm -rf node_modules/ && npm install"

#  LOCALEMMA_PATH
export PATH="$PATH:/Users/rnorris/dev/LocalEmma/bin"

# LOCALEMMA lemma zsh completion
fpath=(/Users/rnorris/dev/LocalEmma/bin $fpath)
autoload -U compinit
compinit
export PATH="/usr/local/sbin:$PATH"
if [[ -s "${ZDOTDIR:-$HOME}/.dinghyenv" ]]; then
    source "${ZDOTDIR:-$HOME}/.dinghyenv"
fi
if [[ -s "${ZDOTDIR:-$HOME}/.docker-commands.sh" ]]; then
    source "${ZDOTDIR:-$HOME}/.docker-commands.sh"
fi
if [[ -s "${ZDOTDIR:-$HOME}/.dinghyenv" ]]; then
    source "${ZDOTDIR:-$HOME}/.dinghyenv"
fi
if [[ -s "${ZDOTDIR:-$HOME}/.docker-commands.sh" ]]; then
    source "${ZDOTDIR:-$HOME}/.docker-commands.sh"
fi
