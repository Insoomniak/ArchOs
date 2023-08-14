
# List all aliases

# Common use
alias cl="clear"
alias mkd="mkdir -vp"
alias mkf="f_makefile"
alias mv="mv -iv"
alias cp="command cp -ivr --parents"
alias v='nvim'
alias vconfig='f_nvimSelectConfig'
alias replace="f_replaceStringsInFiles"
alias compressTar='f_compressTar'
alias compressZip='f_compressZip'
alias extract='f_extractFiles'
alias wget='wget -c '
# Custom Trash system
alias rm="f_trash"
alias rmclear="f_trashClear"
alias rmlist="f_trashList"
# Custom backup system
alias backup="f_backup"
# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add *'
alias gc='git commit -m'
alias gp='git push'
alias gpo='git pull origin'
alias gf="f_gitFull"
alias ginit="f_gitInit"
alias gui="gitui"
# Pacman aliases
alias pacs='sudo pacman -Ss'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacu='sudo update'
alias pacclean='sudo pacman -Rns (pacman -Qtdq)'
alias pachistory="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"
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
alias f="f_fzfAutocomplete"
alias fh="f_fzfSearchHistory"
# Kitty aliases
alias kl="f_kittyLayout"
