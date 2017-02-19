#!/usr/bin/env bash

fullname="$1"
email="$2"

template_file=templates/gitconfig
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > "$HOME/.gitconfig"
