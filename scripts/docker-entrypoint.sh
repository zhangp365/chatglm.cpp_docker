#!/bin/sh

src_dir="/app/default_models"
dest_dir="/app/models"

# Ensure the destination directory exists
mkdir -p "$dest_dir"

# Recursively create symlinks for files and directories from default_models to models
find "$src_dir" -mindepth 1 -type f -o -type d | while read -r item; do
    # Create the relative path
    rel_path="${item#$src_dir/}"
    dest_path="$dest_dir/$rel_path"
    
    # Ensure the parent directory of the destination path exists
    mkdir -p "$(dirname "$dest_path")"
    
    # Create the symlink in the destination directory
    ln -s "$item" "$dest_path"
done

ls /app/models


echo "Soft links created successfully!"

# Print build date
BUILD_DATE=$(cat /build_date.txt)
echo "=== Image build date: $BUILD_DATE ===" 

exec "$@"
