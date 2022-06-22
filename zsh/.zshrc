# Created by uc for 5.8.1

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

##-----------------------------------------------------
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt SHARE_HISTORY          # share history across multiple zsh sessions
setopt APPEND_HISTORY         # append to history
setopt INC_APPEND_HISTORY     # adds commands as they are typed, not at shell exit
setopt HIST_IGNORE_ALL_DUPS   # ignores all duplicates
setopt HIST_SAVE_NO_DUPS      # saves no duplicates
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicates first
setopt HIST_IGNORE_DUPS       # do not store duplications
setopt HIST_FIND_NO_DUPS      #ignore duplicates when searching
setopt HIST_REDUCE_BLANKS     # removes blank lines from history

##-----------------------------------------------------
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

##-----------------------------------------------------
# vi mode
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
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

##-----------------------------------------------------
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

##-----------------------------------------------------

# function powerline_precmd() {
#     PS1="$(/home/uc/go/bin/powerline-go -error $? -jobs ${${(%):%j}:-0})"
#
#     # Uncomment the following line to automatically clear errors after showing
#     # them once. This not only clears the error for powerline-go, but also for
#     # everything else you run in that shell. Don't enable this if you're not
#     # sure this is what you want.
#
#     #set "?"
# }
#
# function install_powerline_precmd() {
#   for s in "${precmd_functions[@]}"; do
#     if [ "$s" = "powerline_precmd" ]; then
#       return
#     fi
#   done
#   precmd_functions+=(powerline_precmd)
# }
#
# if [ "$TERM" != "linux" ] && [ -f "/home/uc/go/bin/powerline-go" ]; then
#     install_powerline_precmd
# fi
#
##-----------------------------------------------------
source /home/uc/.zsh/themes/agnoster.zsh-theme
function fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# zsh correction
# setopt CORRECT
# setopt CORRECT_ALL

# enable AutoCD
setopt AUTO_CD

##-----------------------------------------------------
# Load zsh-autosuggestions
source /home/uc/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load zsh-history-substring-search
source /home/uc/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# Load z directory zumper
source /home/uc/.zsh/plugins/zsh-z/zsh-z.plugin.zsh
autoload -U compinit && compinit
ZSHZ_CASE=smart
# Load zsh-completions
fpath=(/home/uc/.zsh/plugins/zsh-completions/zsh-completions.plugin.zsh $fpath)

export PATH=$PATH:/home/uc/.spicetify
# Load zsh-syntax-highlighting; should be last.
source /home/uc/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
