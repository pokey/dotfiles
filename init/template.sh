#!/usr/bin/env bash
# Instantiate a template and put in particular location.  See templates/ for
# examples and init/init.sh for usage.

tmpl_name="$1"
out="$2"

# From http://stackoverflow.com/a/30872526
template_file="$BASEPATH/templates/$tmpl_name"
template_str=$(cat "${template_file}")
eval "echo \"${template_str}\" > \"$out\""
