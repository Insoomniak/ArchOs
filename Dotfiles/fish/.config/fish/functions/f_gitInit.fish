#fish function to git init, add, commit and push
function f_gitInit
    git init --initial-branch=main
    set github_username Insoomniak
    set repo_name (basename $PWD)
    git remote add origin "git@github.com:$github_username/$repo_name.git"
    git branch -M main
    git add -A ./*
    git commit --allow-empty-message -m 'Initial commit'
    git push --set-upstream origin main

    echo "Repo initialized at : git@github.com:$github_username/$repo_name.git"
end
