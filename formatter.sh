#!/bin/bash

if [ "$GITHUB_EVENT_NAME" == "push" ]; then
  FILES_CHANGED=$(git diff --name-only $GITHUB_BEFORE $GITHUB_SHA)
elif [ "$GITHUB_EVENT_NAME" == "pull_request" ]; then
  FILES_CHANGED=$(git diff --name-only $GITHUB_PR_BASE_SHA $GITHUB_PR_HEAD_SHA)
fi

echo "Changed files: $FILES_CHANGED"
echo $GITHUB_EVENT_NAME
echo "before: $BEFORE"
echo "sha: $GITHUB_SHA"
echo $(git diff --name-only $GITHUB_BEFORE $GITHUB_SHA)

JS_FILES=$(echo "$FILES_CHANGED" | grep -E '\.js$|\.ts$|\.json$|\.html$|\.css$' || true)
PY_FILES=$(echo "$FILES_CHANGED" | grep -E '\.py$' || true)
CPP_FILES=$(echo "$FILES_CHANGED" | grep -E '\.cpp$|\.h$' || true)

if [[ ! -z "$JS_FILES" ]]; then
 echo "Formatting JavaScript files..."
 prettier --write $JS_FILES
fi

if [[ ! -z "$PY_FILES" ]]; then
 echo "Formatting Python files..."
 black $PY_FILES
fi

if [[ ! -z "$CPP_FILES" ]]; then
 echo "Formatting C++ files..."
 clang-format -i $CPP_FILES
fi
