# Fish config file for fzf
set -gx DISABLE_FZF_AUTO_COMPLETION "false"
set -gx DISABLE_FZF_KEY_BINDINGS "false"
set -gx FZF_DEFAULT_COMMAND "fd --hidden --follow --exclude .git"
set -gx FZF_DEFAULT_OPTS "
--exact
--layout=reverse --border --height=90% --padding=1
--multi --ansi --select-1 --exit-0
--preview-window=right:70%
--preview 'bat --color=always --line-range :500 {}' 
--bind='down:down,up:up,ctrl-a:toggle-all'"


