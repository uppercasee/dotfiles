# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by uc for 5.8.1

##-----------------------------------------------------
source /home/uc/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme # Load themes
# Load options 
source /home/uc/.zsh/options.zsh
# Load settings
source /home/uc/.zsh/settings.zsh
# Load Alias
source /home/uc/.zsh/allias.zsh
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
# Load 256color ZSH Plugin
source /home/uc/.zsh/plugins/zsh-256color/zsh-256color.plugin.zsh
# PATH variables
export PATH=$PATH:/home/uc/.spicetify:$HOME/.local/bin
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')         # use to clean duplicates entries

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

# Load zsh-syntax-highlighting; should be last.
source /home/uc/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
