#!/bin/bash

# Increment the version number
current_version=$(jq -r .version version.json)
new_version="v$(echo "$current_version" | awk -F'v' '{print $2}' | awk '{printf "%02d\n", $1 + 1}')"

# Update the JSON file with the new version
jq --arg new_version "$new_version" '.version = $new_version' version.json > version.tmp
mv version.tmp version.json
