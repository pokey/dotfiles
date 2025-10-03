#!/usr/bin/env bash
set -euo pipefail

if "$HOME/pokey-home-files/bin/toggl_check_client.py"; then
  echo "On the clock - use Bold client environment"
  CLAUDE_CONFIG_DIR="$HOME/claude-bold" claude "$@"
else
  echo "Not on the clock - use personal environment"
  envdir ~/envs/context7 claude "$@"
fi
