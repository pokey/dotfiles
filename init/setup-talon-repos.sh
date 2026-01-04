#!/bin/bash
# Setup script to recreate pokey's Talon environment on a new computer
# This script clones the necessary repos, creates symlinks, and sets up the VS Code workspace

set -e

SRC_DIR="$HOME/src"
TALON_USER_DIR="$HOME/.talon/user"

# Repos to clone: dir name (= github repo name) -> git URL
declare -A REPOS=(
    ["andreas-talon"]="git@github.com:AndreasArvidsson/andreas-talon.git"
    ["cursorless"]="git@github.com:cursorless-dev/cursorless.git"
    ["cursorless-talon"]="git@github.com:cursorless-dev/cursorless-talon.git"
    ["git_branchless_talon"]="git@github.com:pokey/git_branchless_talon.git"
    ["mathfly-talon"]="git@github.com:pokey/mathfly-talon.git"
    ["pokey_talon"]="git@github.com:pokey/pokey_talon.git"
    ["pokey_talon_private"]="git@github.com:pokey/pokey_talon_private.git"
    ["rango-talon"]="git@github.com:pokey/rango-talon.git"
    ["restart_talon"]="git@github.com:pokey/restart_talon.git"
    ["talon-gpt"]="git@github.com:pokey/talon-gpt.git"
    ["talon_hud"]="git@github.com:pokey/talon_hud.git"
    ["timings_talon"]="git@github.com:pokey/timings_talon.git"
    ["wax_talon"]="git@github.com:pokey/wax_talon.git"
)

# Test repos for swapper scripts (upstream/clean versions, not symlinked by default)
declare -A TEST_REPOS=(
    ["knausj_talon"]="git@github.com:talonhub/community.git"
    ["talon-ai-tools-dev"]="git@github.com:C-Loftus/talon-ai-tools.git"
    ["talon_hud_dev"]="git@github.com:pokey/talon_hud.git"
)

# Symlinks to create in ~/.talon/user: link name -> target relative to ~/src
# Most are just the repo name, but cursorless has subdirectories
declare -A SYMLINKS=(
    ["andreas-talon"]="andreas-talon"
    ["cursorless-talon"]="cursorless-talon"
    ["cursorless-talon-dev"]="cursorless/cursorless-talon-dev"
    ["git_branchless_talon"]="git_branchless_talon"
    ["mathfly-talon"]="mathfly-talon"
    ["pokey_talon"]="pokey_talon"
    ["pokey_talon_private"]="pokey_talon_private"
    ["rango-talon"]="rango-talon"
    ["restart_talon"]="restart_talon"
    ["talon-gpt"]="talon-gpt"
    ["talon_hud"]="talon_hud"
    ["timings_talon"]="timings_talon"
    ["wax_talon"]="wax_talon"
)

echo "=== Talon Environment Setup ==="
echo ""

# Create directories if they don't exist
mkdir -p "$SRC_DIR"
mkdir -p "$TALON_USER_DIR"

# Clone repos
echo "=== Cloning repositories ==="
for repo in "${!REPOS[@]}"; do
    target_dir="$SRC_DIR/$repo"
    if [ -d "$target_dir" ]; then
        echo "  $repo: already exists, skipping"
    else
        echo "  Cloning $repo..."
        git clone "${REPOS[$repo]}" "$target_dir"
    fi
done
echo ""

# Clone test repos (for swapper scripts)
echo "=== Cloning test repositories (for swapper scripts) ==="
for repo in "${!TEST_REPOS[@]}"; do
    target_dir="$SRC_DIR/$repo"
    if [ -d "$target_dir" ]; then
        echo "  $repo: already exists, skipping"
    else
        echo "  Cloning $repo..."
        git clone "${TEST_REPOS[$repo]}" "$target_dir"
    fi
done
echo ""

# Create symlinks
echo "=== Creating symlinks in $TALON_USER_DIR ==="
for link_name in "${!SYMLINKS[@]}"; do
    target="$SRC_DIR/${SYMLINKS[$link_name]}"
    link_path="$TALON_USER_DIR/$link_name"

    if [ -L "$link_path" ]; then
        echo "  $link_name: symlink already exists, skipping"
    elif [ -e "$link_path" ]; then
        echo "  $link_name: WARNING - file/dir exists but is not a symlink, skipping"
    else
        if [ -e "$target" ]; then
            ln -s "$target" "$link_path"
            echo "  $link_name -> $target"
        else
            echo "  $link_name: WARNING - target $target does not exist, skipping"
        fi
    fi
done
echo ""

# Create VS Code workspace file
echo "=== Creating VS Code workspace file ==="
WORKSPACE_FILE="$SRC_DIR/pokey-talon.code-workspace"
cat > "$WORKSPACE_FILE" << 'EOF'
{
  "folders": [
    {
      "path": "pokey_talon"
    },
    {
      "path": "cursorless-talon"
    },
    {
      "path": "talon_hud"
    },
    {
      "path": "restart_talon"
    },
    {
      "path": "wax_talon"
    },
    {
      "path": "mathfly-talon"
    },
    {
      "path": "rango-talon"
    },
    {
      "path": "talon-gpt"
    },
    {
      "path": "git_branchless_talon"
    },
    {
      "path": "andreas-talon"
    }
  ],
  "settings": {
    "python.defaultInterpreterPath": "~/.talon/bin/python"
  }
}
EOF
echo "  Created $WORKSPACE_FILE"
echo ""

echo "=== Setup complete! ==="
echo ""
echo "To open the workspace in VS Code:"
echo "  code $WORKSPACE_FILE"
