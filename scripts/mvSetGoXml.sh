# Rename Set&GO io XML Files
# Clean the name of each folder inside $pwd off of binwalk crappy naming
# Then move every file inside that folder one up and rename to XML

find -P . -type d -iname "*extracted*" | while read -r folder; do
  base=$(basename $folder)
  stripped=$(echo $base | awk -F"." '{print $1}' | sed "s/^_//")
  mv "$folder/4" "./$stripped.xml"
done
