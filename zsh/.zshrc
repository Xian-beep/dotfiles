### XIAN ZSH ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# History in cache directory
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.cache/zsh/history

# For BASH like PROMPT_COMMAND
preexec() { print -Pn "\e]0;$1\a" }

# For LS colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# For Completion
autoload -U compinit && compinit -U
zstyle ':completion;*' menu select

# For URL paste support
autoload -Uz bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic


# Auto complete with case insensitivity
zstyle ':completion;*' matcher-list '' 'm:{a-zA-Z={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files

bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Directory Handling
setopt auto_cd
setopt multios
setopt prompt_subst

## Sources ##

# Colored LS
source $HOME/scripts/theme-and-appearance-ohmyzsh

# Theme
#source $HOME/scripts/robbyrussel-theme		# Robbyrussel
source $HOME/scripts/lambda-gitster-theme	# Lambda Gitster

# Aliases
source $HOME/.aliases

# Colored Manpages
source $HOME/scripts/colored-man-pages

# Zsh command completion timer
source $HOME/scripts/cmdtime

# Zsh auto suggestions
# 
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Zsh syntax highlighter
# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
