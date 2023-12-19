# Go to main, grab the update, then rebase
git checkout main
git pull
git checkout uu
git rebase main uu
git pull --rebase
