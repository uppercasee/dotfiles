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

# enable AutoCD
setopt AUTO_CD

