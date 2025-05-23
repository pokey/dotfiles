#!/usr/bin/env bash
set -euo pipefail

# Helper function to show usage
show_usage() {
  echo "Usage: run-sketch.sh [options] -- [sketch arguments...] [prompt]"
  echo ""
  echo "Options:"
  echo "  -d, --sketch-dir DIR   Directory containing sketch source (default: ~/src/sketch-clean)"
  echo "  -e, --env ENV          Environment to use (default: determined by toggl status)"
  echo "  --dev                  Use development mode (~/src/sketch instead of ~/src/sketch-clean)"
  echo "  -h, --help             Show this help message"
  echo ""
  echo "Example:"
  echo "  run-sketch.sh -- -open \"My prompt\""
  echo "  run-sketch.sh -- -some-flag -another-flag \"My prompt\""
  exit 0
}

# Default values
TARGET_DIR=$(pwd)
SKETCH_DIR="$HOME/src/sketch-clean"
DEV_MODE=false

# `production` uses no -skaband-addr flag, which will cause sketch
# to just connect to production sketch.dev
SKABAND_ADDR="production"

# Local address for testing
# SKABAND_ADDR="http://localhost:38283"

# No skaband at all
# SKABAND_ADDR=""

USE_UNSAFE=false
FORCE_REBUILD_CONTAINER=false
SPECIFIED_ENV=""

# Check if we're recording a video
VERBOSE=$([ -e /tmp/is-recording-video ] && echo "false" || echo "true")

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
    [ "$VERBOSE" = true ] && echo "On the clock - use Bold client environment"
    ENV_DIR="$HOME/envs/bold/anthropic"
  else
    [ "$VERBOSE" = true ] && echo "Not on the clock - use personal environment"
    ENV_DIR="$HOME/envs/anthropic"
  fi
fi

# Expand ~
SKETCH_DIR="${SKETCH_DIR/#\~/$HOME}"

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
if [ "$SKABAND_ADDR" != production ]; then
  CMD+=("-skaband-addr=$SKABAND_ADDR")
fi

if [ "$USE_UNSAFE" = true ]; then
  CMD+=("-unsafe")
fi

if [ "$VERBOSE" = true ]; then
  CMD+=("-verbose")
fi

if [ "$FORCE_REBUILD_CONTAINER" = true ]; then
  CMD+=("-force-rebuild-container")
fi

# Experiments
export SKETCH_EXPERIMENT="all"

# Process positional args, treating any arg not starting with '-' as part of the prompt
SKETCH_FLAGS=()
PROMPT_PARTS=()

for arg in "${POSITIONAL_ARGS[@]}"; do
  if [[ "$arg" == -* ]]; then
    # This is a flag, add it to sketch flags
    SKETCH_FLAGS+=("$arg")
  else
    # This is not a flag, add it to prompt parts
    PROMPT_PARTS+=("$arg")
  fi
done

# Add any sketch flags to the command
if [ ${#SKETCH_FLAGS[@]} -gt 0 ]; then
  CMD+=("${SKETCH_FLAGS[@]}")
fi

# Combine prompt parts if any exist
if [ ${#PROMPT_PARTS[@]} -gt 0 ]; then
  PROMPT="${PROMPT_PARTS[*]}"
  CMD+=("-prompt" "$PROMPT")
fi

# Execute the command
[ "$VERBOSE" = true ] && echo "Running: ${CMD[*]}"
exec "${CMD[@]}"
