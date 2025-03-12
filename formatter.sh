if [ "${{ github.event_name }}" == "push" ]; then
 FILES_CHANGED=$(git diff --name-only ${{ github.event.before }} ${{ github.sha }})
elif [ "${{ github.event_name }}" == "pull_request" ]; then
 FILES_CHANGED=$(git diff --name-only ${{ github.event.pull_request.base.sha }} ${{ github.event.pull_request.head.sha }})
fi

echo "Changed files: $FILES_CHANGED"

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
