# Fish keybindings
# ~/.config/fish/config.fish

# Delete all previous keybindings
for key in (bind -l)
    bind -e $key
end

# list mofifiers for keybindings are :
# ctrl: \c  alt: \e  shift: \s  meta: \m

# Tab to accept autosuggestion
bind \t accept-autosuggestion
# Ctrl+Space transformed to ctrl+L by kitty conf
bind \cl complete
#bind \cf function_fzfEdit
bind \cf f_fzfAutocomplete
bind \ch f_fzfSearchHistory
bind \cu backward-word
bind \co forward-word
bind \cd backward-kill-word




