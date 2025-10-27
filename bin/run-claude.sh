#!/usr/bin/env bash
set -euo pipefail

if client_name=$("$HOME/pokey-home-files/bin/toggl_check_client.py" 2>/dev/null); then
  echo "On the clock - use $client_name client environment"
  CLAUDE_CONFIG_DIR="$HOME/claude-$client_name" claude "$@"
else
  echo "Not on the clock - use personal environment"
  envdir ~/envs/context7 claude "$@"
fi
