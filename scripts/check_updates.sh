#!/bin/sh

REPO_PATH=$1

if [ -z "$REPO_PATH" ]; then
    exit 0
fi

# Get the name of the current branch
branch=$(git -C "$REPO_PATH" rev-parse --abbrev-ref HEAD)

# Get the hash of the most recent commit on the local branch
local_commit=$(git -C "$REPO_PATH" rev-list --max-count=1 "$branch")

git -C "$REPO_PATH" fetch

# Get the hash of the most recent commit on the corresponding remote branch
remote_commit=$(git -C "$REPO_PATH" rev-list --max-count=1 origin/"$branch")

# Count the number of commits between the local and remote branches
commits_behind=$(git -C "$REPO_PATH" rev-list --count "$local_commit".."$remote_commit")

exit "$commits_behind"
