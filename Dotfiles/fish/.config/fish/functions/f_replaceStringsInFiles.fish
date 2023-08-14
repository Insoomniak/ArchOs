# fish function to replace old string with new string in a file
function f_replaceStringsInFiles
    set -l old $argv[1]
    set -l new $argv[2]
    set -l file $argv[3]
    sed -i "s/$old/$new/g" $file
end