#fish function to make a file parent directory and the file
function f_makefile
    mkdir -vp (dirname $argv)
    touch $argv
end