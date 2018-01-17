for file in ~/.{aliases,exports,extra,work-aliases}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
# z
. ~/bin/z/z.sh 

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

bindkey "^b" backward-word
bindkey "^w" forward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line

