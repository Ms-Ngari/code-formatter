#!bin/bash

echo "======================================================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

sh formatter.sh

git add -A && git commit -m "Format Code"
git push --set-upstream origin main

echo "======================================================="
