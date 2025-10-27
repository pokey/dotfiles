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
  echo "The script will also read additional arguments from .sketch-args file in the target directory"
  echo "if it exists. Each line should contain one argument. Lines starting with # are ignored."
  echo ""
  echo "Example:"
  echo "  run-sketch.sh -- -open -prompt \"My prompt\""
  echo "  run-sketch.sh -- -some-flag -another-flag -prompt \"My prompt\""
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
  if client_name=$("$HOME/pokey-home-files/bin/toggl_check_client.py" 2>/dev/null); then
    [ "$VERBOSE" = true ] && echo "On the clock - use $client_name client environment"
    ENV_DIR="$HOME/envs/$client_name/anthropic"
  else
    [ "$VERBOSE" = true ] && echo "Not on the clock - use personal environment"
    ENV_DIR="$HOME/envs/anthropic"
  fi
fi

# Expand ~
SKETCH_DIR="${SKETCH_DIR/#\~/$HOME}"

# Change to the sketch directory
cd "$TARGET_DIR" || {
  echo "Failed to change to directory: $TARGET_DIR"
  exit 1
}

# Generate code if in dev mode
if [ "$DEV_MODE" = true ]; then
  go generate 'sketch.dev/loop/...'
fi

# Build the sketch command with Context7 API key from environment
# We use envdir to load both the main env and Context7 API key
CONTEXT7_API_KEY=$(cat "$HOME/envs/context7/CONTEXT7_API_KEY")
MCP_CONFIG='{"name": "context7", "type": "http", "url": "https://mcp.context7.com/mcp", "headers": {"CONTEXT7_API_KEY": "'"$CONTEXT7_API_KEY"'"}}'
CMD=("envdir" "$ENV_DIR" "$SKETCH_DIR/sketch" "-mcp" "$MCP_CONFIG")

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

# Check for .sketch-args file in the target directory and add its contents
SKETCH_ARGS_FILE="$TARGET_DIR/.sketch-args"
if [ -f "$SKETCH_ARGS_FILE" ]; then
  # Security check: ensure the file is readable and not a symlink to prevent directory traversal attacks
  if [ -L "$SKETCH_ARGS_FILE" ]; then
    [ "$VERBOSE" = true ] && echo "Warning: Ignoring .sketch-args because it's a symbolic link (security precaution)"
  elif [ ! -r "$SKETCH_ARGS_FILE" ]; then
    [ "$VERBOSE" = true ] && echo "Warning: .sketch-args file exists but is not readable"
  else
    # Read the file safely, ignoring empty lines and comments
    while IFS= read -r line || [ -n "$line" ]; do
      # Skip empty lines and comments (lines starting with #)
      if [[ -n "$line" && ! "$line" =~ ^[[:space:]]*# ]]; then
        # Security: Only allow safe characters (alphanumeric, spaces, dashes, underscores, equals, slashes, dots, colons, tildes)
        if [[ "$line" =~ ^[a-zA-Z0-9[:space:]._/=:~-]+$ ]]; then
          CMD+=("$line")
          [ "$VERBOSE" = true ] && echo "Added from .sketch-args: $line"
        else
          [ "$VERBOSE" = true ] && echo "Warning: Skipping potentially unsafe argument from .sketch-args: $line"
        fi
      fi
    done <"$SKETCH_ARGS_FILE"
  fi
fi

# Add any remaining positional args directly to the command
if [ ${#POSITIONAL_ARGS[@]} -gt 0 ]; then
  CMD+=("${POSITIONAL_ARGS[@]}")
fi

# Execute the command
if [ "$VERBOSE" = true ]; then
  # Sanitize the command output to hide the API key
  SANITIZED_CMD=("${CMD[@]}")
  # Replace the MCP config in the sanitized version
  for i in "${!SANITIZED_CMD[@]}"; do
    if [[ "${SANITIZED_CMD[$i]}" == *"CONTEXT7_API_KEY"* ]]; then
      SANITIZED_CMD[$i]='{"name": "context7", "type": "http", "url": "https://mcp.context7.com/mcp", "headers": {"CONTEXT7_API_KEY": "***REDACTED***"}}'
    fi
  done
  echo "Running: ${SANITIZED_CMD[*]}"
fi
exec "${CMD[@]}"
