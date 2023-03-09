#/!bin/sh
echo "Author,Count"
git shortlog -s -n --all | while read count author; do
    echo "$author,$count"
done 