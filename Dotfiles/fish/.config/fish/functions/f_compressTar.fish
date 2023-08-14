# Fish function to compress as tar archive
function f_compressTar
    set file $argv[1]
    tar -czf $file.tar.gz $file
    echo "$file compressed"
end