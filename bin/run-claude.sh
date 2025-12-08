#!/usr/bin/env bash
set -euo pipefail

if client_name=$("$HOME/pokey-home-files/bin/toggl_check_client.py"); then
  echo "On the clock - using $client_name client environment"
  CLAUDE_CONFIG_DIR="$HOME/claude-$client_name" envdir ~/envs/context7 claude "$@"
else
  echo "Not on the clock - using personal environment"
  envdir ~/envs/context7 claude "$@"
fi