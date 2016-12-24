#Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# z
. ~/bin/z/z.sh 

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

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

##########################################################
# mysql aliases
##########################################################
alias start_mysql='sudo /usr/local/mysql/bin/mysqld_safe &'
alias stop_mysql='sudo /usr/local/mysql/bin/mysqladmin shutdown'

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
alias sigh="rm -rf node_modules/ && npm install"

