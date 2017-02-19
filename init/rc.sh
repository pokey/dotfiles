#!/usr/bin/env bash

BASEPATH="$1"

template_file=templates/zshrc
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > $HOME/.zshrc

template_file=templates/bashrc
template_str=$(cat "${template_file}")
val=$(eval "echo \"${template_str}\"")
echo "$val" > $HOME/.bashrc
