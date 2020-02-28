# Lines configured by zsh-newuser-install
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="oxide"
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
bindkey "^?" backward-delete-char
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/svilim/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

KEYTIMEOUT=0
xset r rate 200 40

export FZF_DEFAULT_COMMAND='fd'
export JAVA_HOME="/usr/lib/jvm/java-11-amazon-corretto"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
