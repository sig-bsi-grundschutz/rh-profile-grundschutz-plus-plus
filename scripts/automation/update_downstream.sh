#!/bin/bash
set -eo pipefail

source config.env

export COMMIT_TITLE="chore: Profiles automatic update."
export COMMIT_BODY="Sync profiles from $REPO_PROFILE"
BRANCH="profiles_autoupdate"

git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
cd "$REPO_COMPONENT_DEFINITION"

git fetch origin
if gh pr list -H "$BRANCH" -B develop --state open --json number -q '.[0].number' | grep -q .; then
  git checkout -B "$BRANCH" "origin/$BRANCH"
else
  # No open PR: start fresh from develop (replaces a stale post-merge branch).
  git checkout -B "$BRANCH" origin/develop
fi

cp -r ../profiles .
if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing to commit"
else
  git add profiles
  if [ -z "$(git status --untracked-files=no --porcelain)" ]; then
     echo "Nothing to commit"
  else
     git commit --message "$COMMIT_TITLE"
     # Push via named remote origin (checkout already has GIT_TOKEN).
     # Raw URL + --force-with-lease fails with (stale info) when the
     # leftover profiles_autoupdate branch still exists on the remote.
     if gh pr list -H "$BRANCH" -B develop --state open --json number -q '.[0].number' | grep -q .; then
       git push -u origin "$BRANCH"
       echo "Updated existing open PR on $BRANCH"
     else
       git push -u --force-with-lease origin "$BRANCH"
       echo "$COMMIT_BODY"
       gh pr create -t "$COMMIT_TITLE" -b "$COMMIT_BODY" -B "develop" -H "$BRANCH"
     fi
  fi
fi
