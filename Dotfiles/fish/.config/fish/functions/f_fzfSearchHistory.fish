# Fish function to search in history using fzf with ctrl-h keybinding
function f_fzfSearchHistory
    if test -z "$fish_private_mode"
        builtin history merge
    end
    # Delinate commands throughout pipeline using null rather than newlines because commands can be multi-line
    set commands_selected (
        # Reference https://devhints.io/strftime to understand strftime format symbols
        builtin history --null --show-time="%m-%d %H:%M:%S │ " |
        fzf --read0 \
            --print0 \
            --multi \
            --tiebreak=index \
            --prompt="Search History> " \
            --query=(commandline) \
            --preview="echo -- {4..} | fish_indent --ansi" \
            --preview-window="bottom:3:wrap" \
            $fzf_history_opts |
        string split0 |
        # remove timestamps from commands selected
        string replace --regex '^\d\d-\d\d \d\d:\d\d:\d\d │ ' ''
    )

    if test $status -eq 0
        commandline --replace -- $commands_selected
    end

    commandline --function repaint
end