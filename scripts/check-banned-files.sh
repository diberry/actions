errors=""
banned_files=$(tr '[:upper:]' '[:lower:]' < ./.github/policies/banned-files.txt | xargs)
git diff --name-only --diff-filter=A origin/main | while IFS= read -r file; do
    file_lower=$(echo "$file" | tr '[:upper:]' '[:lower:]' | xargs)
    if echo "$banned_files" | grep -Fxq "$file_lower"; then
    errors="${errors}File $file is not allowed with this name and path\n"
    fibash
done
if [ -n "$errors" ]; then
    echo -e "$errors"
    exit 1
fi