#!/usr/bin/env bash
set -euo pipefail

# Helper function to show usage
show_usage() {
  echo "Usage: run-sketch.sh [options] -- [sketch arguments...]"
  echo ""
  echo "Options:"
  echo "  -d, --sketch-dir DIR   Directory containing sketch source (default: ~/src/sketch-clean)"
  echo "  -e, --env ENV          Environment to use (default: determined by toggl status)"
  echo "  --dev                  Use development mode (~/src/sketch instead of ~/src/sketch-clean)"
  echo "  -h, --help             Show this help message"
  echo ""
  echo "Example:"
  echo "  run-sketch.sh -- -open \"My prompt\""
  exit 0
}

# Default values
TARGET_DIR=$(pwd)
SKETCH_DIR="$HOME/src/sketch-clean"
DEV_MODE=false
SKABAND_ADDR="http://localhost:38283"
USE_UNSAFE=true
SPECIFIED_ENV=""

# Parse command line arguments
POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
  -d | --sketch-dir)
    SKETCH_DIR="$2"
    shift 2
    ;;
  -e | --env)
    SPECIFIED_ENV="$2"
    shift 2
    ;;
  --dev)
    DEV_MODE=true
    shift
    ;;
  -h | --help)
    show_usage
    ;;
  --)
    shift
    POSITIONAL_ARGS+=("$@")
    break
    ;;
  *)
    POSITIONAL_ARGS+=("$1")
    shift
    ;;
  esac
done

# Determine which environment directory to use
if [ -n "$SPECIFIED_ENV" ]; then
  ENV_DIR="$SPECIFIED_ENV"
else
  if "$HOME/pokey-home-files/bin/toggl_check_client.py"; then
    echo "On the clock - use Bold client environment"
    ENV_DIR="$HOME/envs/bold/anthropic"
  else
    echo "Not on the clock - use personal environment"
    ENV_DIR="$HOME/envs/anthropic"
  fi
fi

# Change to the sketch directory
cd "$SKETCH_DIR" || {
  echo "Failed to change to directory: $SKETCH_DIR"
  exit 1
}

# Generate code if in dev mode
if [ "$DEV_MODE" = true ]; then
  go generate 'sketch.dev/loop/...'
fi

# Build the sketch command
CMD=("envdir" "$ENV_DIR" "go" "run" "./cmd/sketch" "-C" "$TARGET_DIR")

# Add standard flags
if [ "$SKABAND_ADDR" != "" ]; then
  CMD+=("-skaband-addr=$SKABAND_ADDR")
fi

if [ "$USE_UNSAFE" = true ]; then
  CMD+=("-unsafe")
fi

# Add all remaining arguments
CMD+=("${POSITIONAL_ARGS[@]}")

# Execute the command
echo "Running: ${CMD[*]}"
exec "${CMD[@]}"
