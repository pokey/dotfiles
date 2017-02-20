#!/usr/bin/env bash

fullname="$1"
email="$2"

# From http://stackoverflow.com/a/30872526
template_file=templates/gitconfig
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > "$HOME/.gitconfig"
