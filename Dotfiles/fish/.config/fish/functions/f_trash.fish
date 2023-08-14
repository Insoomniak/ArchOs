# fish function to moove file or folder to trash folder in $HOME/.trash
function f_trash
    set -l trash $HOME/.trash
    set -l date (date +%Y-%m-%d-%H-%M-%S)
    mkdir -vp $trash/$date

    for file in $argv
        mv -v $file $trash/$date
        echo "$file trashed"
    end
end
