#fish function to git add, commit and push
function f_gitFull
    git add -A
    git commit --allow-empty-message -m ''
    git push
    echo "All files send to github"
end
