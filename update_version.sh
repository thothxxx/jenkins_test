#!/bin/bash

# Define the path to your JSON file
json_file="./version.json"

# Read the current version from the JSON file
current_version=$(cat "$json_file" | grep -oP '(?<=("version": )).*(?=,?)')

# Increment the version number (e.g., by one)
new_version=$((current_version + 1))

# Update the version in the JSON file
sed -i "s/\"version\": $current_version/\"version\": $new_version/" "$json_file"