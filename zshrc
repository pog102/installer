source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Luke's config for the Zoomer Shell
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
export PATH=$HOME/.bin:$PATH
# Enable colors and change rompt:
# cat ~/.cache/wal/sequences
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[blue]%} %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
# setopt HIST_FIND_NO_DUPS
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1
# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -sel clip
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

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
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
source "$HOME/.config/zsh/aliasrc"
source "$HOME/.config/zsh/functions.zsh"

# Load zsh-syntax-highlighting; should be last.
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


## Color man pagesexport 
LESS_TERMCAP_mb=$'\E[01;32m'export 
LESS_TERMCAP_md=$'\E[01;32m'export 
LESS_TERMCAP_me=$'\E[0m'export 
LESS_TERMCAP_se=$'\E[0m'export 
LESS_TERMCAP_so=$'\E[01;47;34m'export 
LESS_TERMCAP_ue=$'\E[0m'export 
LESS_TERMCAP_us=$'\E[01;36m'export 
LESS=-R


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
