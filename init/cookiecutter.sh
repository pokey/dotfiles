#!/usr/bin/env bash

fullname="$1"
gh_user="$2"
email="$3"

# From http://stackoverflow.com/a/30872526
template_file=templates/cookiecutterrc
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > $HOME/.cookiecutterrc
