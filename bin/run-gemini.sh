#!/usr/bin/env bash
set -euo pipefail

if client_name=$("$HOME/pokey-home-files/bin/toggl_check_client.py"); then
  echo "On the clock - using $client_name client environment"
  envdir ~/envs/context7 envdir ~/envs/$client_name/gemini gemini "$@"
else
  echo "Not On the clock - using personal environment"
  envdir ~/envs/context7 envdir ~/envs/gemini gemini "$@"
fi