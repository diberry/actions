errors=""
while IFS= read -r file; do
    file_lower=$(echo "$file" | tr '[:upper:]' '[:lower:]' | xargs)
    while IFS= read -r required_file; do
    required_file_lower=$(echo "$required_file" | tr '[:upper:]' '[:lower:]' | xargs)
    if [ "$file_lower" = "$required_file_lower" ]; then
        errors="${errors}File $file is not allowed to be deleted\n"
    fi
    done < <(tr '[:upper:]' '[:lower:]' < ./.github/policies/required-files.txt)
done
if [ -n "$errors" ]; then
    echo -e "$errors"
    exit 1
fi