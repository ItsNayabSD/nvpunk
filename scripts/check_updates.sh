#!/bin/sh

# Get the name of the current branch
branch=$(git rev-parse --abbrev-ref HEAD)

# Get the hash of the most recent commit on the local branch
local_commit=$(git rev-list --max-count=1 "$branch")

# Get the hash of the most recent commit on the corresponding remote branch
remote_commit=$(git rev-list --max-count=1 origin/"$branch")

# Count the number of commits between the local and remote branches
commits_behind=$(git rev-list --count "$local_commit".."$remote_commit")

exit "$commits_behind"
