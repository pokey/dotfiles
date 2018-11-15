#
# Pokey virtualenv
#
# Customized venv display that is optimized for the situation where the user
# generally has a venv activated whose name matches the current git repository.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_POKEY_VENV_SHOW="${SPACESHIP_POKEY_VENV_SHOW=true}"
SPACESHIP_POKEY_VENV_PREFIX="${SPACESHIP_POKEY_VENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_POKEY_VENV_SUFFIX="${SPACESHIP_POKEY_VENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_POKEY_VENV_SYMBOL="${SPACESHIP_POKEY_VENV_SYMBOL="❁ "}"
# The (A) expansion flag creates an array, the '=' activates word splitting
SPACESHIP_POKEY_VENV_COLOR="${SPACESHIP_POKEY_VENV_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current virtual environment (Python).
spaceship_pokey_venv() {
    [[ $SPACESHIP_POKEY_VENV_SHOW == false ]] && return

    # This is necessary for the way we check for Python files
    setopt local_options extended_glob

    local color="$SPACESHIP_POKEY_VENV_COLOR"
    local symbol="$SPACESHIP_POKEY_VENV_SYMBOL"
    local pokey_venv="$VIRTUAL_ENV:t"

    # If it's a git repository, then we replace the virtualenv with a check
    # mark if it matches the name of the git repository
    if spaceship::is_git; then
        local git_root=$(git rev-parse --show-toplevel)
        local git_name="$git_root:t"

        if [ "$git_name" = "$pokey_venv" ]; then
            symbol=""
            pokey_venv="✔"
        fi
    fi

    # If we're in a Python directory (ie has Python-related files), then we
    # disply a red 'X' if there's no active virtualenv
    local is_python=false
    [[ -f requirements.txt || -f pyproject.toml || -n *.py(#qN^/) ]] && \
        is_python=true
    if [ -z "$pokey_venv" ] && [ "$is_python" = true ]; then
        color="red"
        symbol=""
        pokey_venv="✕"
    fi

    [ -n "$pokey_venv" ] || return

    spaceship::section \
        "$color" \
        "$SPACESHIP_POKEY_VENV_PREFIX" \
        "${symbol}${pokey_venv} " \
        "$SPACESHIP_POKEY_VENV_SUFFIX"
}
