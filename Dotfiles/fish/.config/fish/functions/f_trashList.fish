
# fish function to list all files in trash folder using lts
function f_trashList
    set -l trash $HOME/.trash
    lts $trash
end