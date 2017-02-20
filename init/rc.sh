#!/usr/bin/env bash

BASEPATH="$1"

# From http://stackoverflow.com/a/30872526
template_file=templates/zshrc
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > $HOME/.zshrc

# From http://stackoverflow.com/a/30872526
template_file=templates/bashrc
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > $HOME/.bashrc
