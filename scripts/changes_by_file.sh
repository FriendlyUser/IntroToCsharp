#!/bin/bash

# Get a list of all authors in the repository
AUTHORS=$(git log --format='%ae' | sort -u)

# Set the list of file extensions to search for
EXTENSIONS=("md" "ipynb" "sh" "html")
echo "Count,File"
# Loop through the authors and file extensions and search for changes
for author in $AUTHORS; do
    for extension in "${EXTENSIONS[@]}"; do
        # echo "Changes made by $author to .$extension files:"
        git log --author="$author" --oneline --name-only --pretty=format: | grep "\.$extension$" | sort | uniq -c | sort -rn | head -n 10 | awk -F' ' '{print $1","$2}'
    done
done
