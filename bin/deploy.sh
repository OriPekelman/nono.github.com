#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# Build the project
hugo -t hugo-redlounge

# Add changes to git
git add -A

# Commit changes
msg="Rebuilding site $(date)"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos
git push origin master
git subtree push --prefix=public git@github.com:nono/nono.github.com.git master