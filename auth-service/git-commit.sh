#!/bin/bash

cd ..


if [ $# -lt 2 ]; then
    echo "Usage: $0 <commit_message> <branch_name>"
    exit 1
fi

echo "commiting changes"


# Check if there are any changes to stash
if ! git diff-index --quiet HEAD --; then
    echo "Stashing changes..."
    git stash push -m "Stash changes before switching branches"
fi

# Switch to the specified branch
echo "Switching to branch $2..."
git checkout -b "$2"

# Apply stashed changes if any
if git stash list | grep -q "Stash changes before switching branches"; then
    echo "Applying stashed changes..."
    git stash apply
fi


git add .

git commit -m "$1"

git push -u origin "$2"


###########
#./git-commit.sh "Your commit message here" main
##############