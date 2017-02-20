#!/usr/bin/env bash

BASEPATH="$1"
fullname="$2"
email="$3"

# From http://stackoverflow.com/a/30872526
template_file="$BASEPATH/templates/gitconfig"
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > "$HOME/.gitconfig"
