#!/usr/bin/env bash

fullname="$1"
gh_user="$2"
email="$3"

template_file=templates/cookiecutterrc
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > $HOME/.cookiecutterrc
