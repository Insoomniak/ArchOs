# Fish function to extract all types of archives
function f_extractFiles
    set file $argv[1]
    switch (string match -r '.*\.(.+)' $file)[-1]
        case 'zip'
            unzip $file
        case 'rar'
            unrar x $file
        case 'tar'
            tar xf $file
        case 'gz' 'tgz'
            tar xzf $file
        case 'bz2' 'tbz' 'tbz2'
            tar xjf $file
        case 'xz'
            tar xJf $file
        case '7z'
            7z x $file
        case '*'
            echo "Unsupported file format"
            return 1
    end
    echo "$file extracted"
end