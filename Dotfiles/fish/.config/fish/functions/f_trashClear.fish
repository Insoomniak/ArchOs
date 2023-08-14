# fish function to delete all files in trash folder
function f_trashClear
    set -l trash $HOME/.trash
    command rm -rf $trash/*
    echo "Trash folder cleared"
end