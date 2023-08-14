# Fish function to compress as zip archive
function f_compressZip
    set file $argv[1]
    zip -r $file.zip $file
    echo "$file compressed"
end