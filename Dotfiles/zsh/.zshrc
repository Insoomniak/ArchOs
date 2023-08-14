# Define path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ZSH custom config folder
ZSH_CUSTOM=$ZSH/custom
# Init Zoxide and define "c" command to use
eval "$(zoxide init zsh --cmd c)"
# Load theme
ZSH_THEME="powerlevel10k/powerlevel10k"
# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Define editor
export EDITOR='/usr/bin/nvim'
# Define language environment
export LANG=en_US.UTF-8
#Define the color of auto suggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment to use hyphen-insensitive completion. Case-sensitive completion must be off.
# HYPHEN_INSENSITIVE="true"
# Auto update [disabled, auto, reminder]
zstyle ':omz:update' mode auto
# Auto update frequency in days
zstyle ':omz:update' frequency 1
# Define auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# Define command auto-correction.
ENABLE_CORRECTION="true"
# Stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"
# FZF configs
DISABLE_FZF_AUTO_COMPLETION="false"
DISABLE_FZF_KEY_BINDINGS="true"
export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='
--height=100% --padding=1
--no-multi --select-1 --exit-0
--preview "bat --color=always --line-range :500 {}"
'

# Plugins to load, list can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  ssh-agent
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-vi-mode
  fzf
  extract
  )
# Load oh-my-zsh.sh script after plugins oad but before alias to ocerwrite it
source $ZSH/oh-my-zsh.sh

### Keybindings
# Add ctrl+space to autocomplete in prompt.
#bindkey '^ ' autosuggest-accept
source $ZSH_CUSTOM/bindkey.zsh

### Remove all unnecessary aliases created by oh-my-zsh
unalias ${(k)aliases}

### Aliases
# Common use
alias cl="clear"
alias mkd="mkdir -vp"
alias mkf="function-makefile"
alias mv="mv -iv"
alias cp="command cp -ivr"
alias v='nvim'
alias replace="function-replace"
# Custom Trash system
alias rm="function-trash"
alias rmclear="function-trashclear"
alias rmlist="function-trashlist"
# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add *'
alias gc='git commit -m'
alias gp='git push'
alias gpo='git pull origin'
alias gf="function-gitFull"
alias gui="gitui"
# Pacman aliases
alias pacs='sudo pacman -Ss'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacu='sudo update'
alias pacclean='sudo pacman -Rns (pacman -Qtdq)'
alias pachistory="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
# Replace ls with exa
alias ls='exa --color=always --group-directories-first --icons' # clean listing
alias lsa='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias lts='exa -aT --level=2 --color=always --group-directories-first --icons' # tree listing short
alias ip='ip -color'
# Replace cat with bat
alias cat='bat --style header --style snip --style changes --style header'
# Ripgrep aliases
alias search="rg --hidden"
# Fzf aliases
alias f="fzf"
alias fe='function-findAndEdit'
alias fc='function-findAndChangeDir'
# Kitty aliases
alias kl="function-kittylayout"
# Aliases by Garuda
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"
# Replace some more things with better alternatives
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'


# Functions
function-makefile() { 
  mkdir -p "$(dirname "$1")" && touch "$1"
}
# Git full
function-gitFull() { 
  git add * 
  git commit --allow-empty-message -m ''
  git push
  echo "All files send to github"
}
# Find and edit 
function-findAndEdit() {
    local result=$(fd -H -t f | fzf --query="$1")
    if [[ -n $result ]]; then
        $EDITOR "$result"
    fi
}
# Find and change to dir or parent's file dir
function-findAndChangeDir() {
    local result=$(fd -H -t f | fzf --query="$1")
    if [[ -n $result ]]; then
      if [ -d $result ]; then 
        cd "$result"; else 
        cd "$(dirname "$result")"
      fi 
    fi
}
# replace oldValue newValue myFile.txt
function-replace() {
    sed -i "s/$1/$2/g" "$3"
}
# Moove files in .trash folder
function-trash() {
    local trash_dir="$HOME/.trash"
    local parenttarget="$trash_dir/$(date +'%Y-%m-%d-%H-%M-%S')"
    local target="$parenttarget/$(basename "$1")"
    command mkdir $parenttarget
    command mv "$1" "$target" && echo "Trashed $1"
}
# Empty the .trash folder
function-trashclear() {
    local trash_dir="$HOME/.trash"
    command rm -rf $trash_dir/* && echo "Cleared the trash folder"
}
# Make lts on the .trash folder
function-trashlist() {
    local trash_dir="$HOME/.trash"
    lts $trash_dir
}
function-kittylayout() {
  kitty @ new-window
  kitty @ new-window
  kitty @ new-window
  kitty @ resize-window --increment -10 --axis vertical
  # Add more commands here
}
