#================================DEPENDENCIES==================================#
#
# zsh-syntax-highlighting
# zsh-autosuggestions
# fzf
# zoxide
#
#================================DEPENDENCIES==================================#


#================================PROMPT_CONFIG=================================#

#________________________________GIT_CONFIG____________________________________#

local git="#8be9fd"
local text="#f8f8f2"
local staged="#50fa7b"
local unstaged="#ffb86c"
local action="#ff5555"
local dim="#6272a4"

# Enable vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

# Formats
zstyle ':vcs_info:git:*' formats " %F{$git} %F{$text}%b%c%u%f"
zstyle ':vcs_info:git:*' actionformats " %F{$git} %F{$text}%b %F{$action}(%a)%f%c%u"

# Change indicators
zstyle ':vcs_info:git:*' unstagedstr "%F{$unstaged} %f"
zstyle ':vcs_info:git:*' stagedstr "%F{$staged} %f"

# Update prompt hook
precmd() { vcs_info }

#________________________________GIT_CONFIG____________________________________#

# Colors
autoload -U colors && colors
setopt prompt_subst

PROMPT='%B%F{1}%n%f%F{#6272a4}@%F{#8be9fd}%m%f %F{215}%~%f%b${vcs_info_msg_0_} %F{177}%#%f '

#================================PROMPT_CONFIG=================================#


#================================HISTORY_CONFIG================================#

setopt histignorealldups sharehistory

HISTSIZE=1000 # Save 1000 lines of history
SAVEHIST=1000
HISTFILE=~/.zsh_history

#================================HISTORY_CONFIG================================#


#================================COMPLETION_CONFIG=============================#

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	# Include hidden files.

#================================COMPLETION_CONFIG=============================#


#================================VIM_MODE======================================#

# Start vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap
    echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#================================VIM_MODE======================================#


#================================ZSH_DEFAULTS==================================#

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#================================ZSH_DEFAULTS==================================#


#================================PATHS_AND_ALIASES=============================#

alias comp="gcc -Wall -Wextra -Werror"
alias xcpy="xclip -selection clipboard"

export PATH="$PATH:$HOME/.local/bin"

#================================PATHS_AND_ALIASES=============================#


#================================PLUGINS=======================================#

# zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZOXIDE
eval "$(zoxide init zsh)"

#================================PLUGINS=======================================#
