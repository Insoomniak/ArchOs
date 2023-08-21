# Hide welcome message
set fish_greeting
# Define default editor
set -gx EDITOR "nvim"
set -gx them_powerline_fonts yes
# Define manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
# Disable useless infos in prompt
set VIRTUAL_ENV_DISABLE_PROMPT "1"
# Set nvim config folder path
set -gx NVIM_APPNAME "nvim/CustomizedNvim"
# Set nix env path for fish

# Source Aliases
source $HOME/.config/fish/aliases.fish
# Source Functions
source $HOME/.config/fish/functions.fish
# Source keybindings
source $HOME/.config/fish/keybindings.fish
# Source Zoxide
zoxide init fish --cmd c | source
# Source FZF config and keybindings
source $HOME/.config/fish/fzf.fish
# Source Starship
starship init fish | source
# Source command-not-found tool
# source /usr/share/doc/find-the-command/ftc.fish
