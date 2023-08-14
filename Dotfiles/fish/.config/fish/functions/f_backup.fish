# Fish function to copy file or folder to backup folder in $HOME/.backup
function f_backup
    set -l file $argv[1]
    set -l backup $HOME/.backup
    set -l date (date +%Y-%m-%d-%H-%M-%S)
    mkdir -vp $backup/$date
    cp -rv $file $backup/$date
    echo "$file backed up"
end
