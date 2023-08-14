# Fish function to autocomplete file paths using fzf with ctrl-f keybinding
function f_fzfAutocomplete
    set token (commandline --current-token)
    set token (eval echo -- $token)
    set token (string unescape -- $token)
    set file_paths_selected (fzf --query="$token")
    if test $status -eq 0
        commandline --current-token --replace -- (string escape -- $file_paths_selected | string join ' ')
    end
    commandline --function repaint
end
