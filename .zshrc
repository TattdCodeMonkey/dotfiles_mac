# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for file in ~/.{aliases,exports,extra,work-aliases}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="false"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

plugins=(git z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p11k configure` or edit ~/.p11k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey "^b" backward-word
bindkey "^w" forward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. "$HOME/.local/bin/env"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/rodney/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
