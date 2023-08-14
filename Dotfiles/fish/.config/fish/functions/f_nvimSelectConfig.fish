# Fish function to change nvim config folder
function f_nvimSelectConfig
    # List all directories in the ~/.config/nvim folder and past their final names to fzf
    #set selected_dir (ls -d ~/.config/nvim/*| sed 's/.*nvim\///' | fzf --height 40% --layout=reverse --preview 'tree -C {}' --preview-window=right:60%:wrap --bind=ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-f:page-down,ctrl-b:page-up,ctrl-a:toggle-all,ctrl-t:toggle,ctrl-s:toggle-sort,ctrl-r:toggle-sort --cycle --reverse --multi --ansi --header="Select nvim config folder" --prompt="nvim config > " --query="$argv[1]" --exit-0)
    set selected_dir (ls -d ~/.config/nvim/*| sed 's/.*nvim\///' | fzf --prompt="select config > ")
    
    if test -n "$selected_dir"
        # Set the environment variable MY_SELECTED_NVIM_DIR to the selected directory
        set -gx NVIM_APPNAME "nvim/$selected_dir"
        echo "Nvim config set to 'nvim/$selected_dir'"
    else
        echo "No config selected."
    end
end
