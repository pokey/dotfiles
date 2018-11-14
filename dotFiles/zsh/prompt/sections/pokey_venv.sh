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
SPACESHIP_POKEY_VENV_SYMBOL="${SPACESHIP_POKEY_VENV_SYMBOL=""}"
# The (A) expansion flag creates an array, the '=' activates word splitting
SPACESHIP_POKEY_VENV_COLOR="${SPACESHIP_POKEY_VENV_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current virtual environment (Python).
spaceship_pokey_venv() {
    [[ $SPACESHIP_POKEY_VENV_SHOW == false ]] && return

    setopt local_options extended_glob

    local color="$SPACESHIP_POKEY_VENV_COLOR"
    local pokey_venv="$VIRTUAL_ENV:t"
    local is_python=false
    [[ -f requirements.txt || -f pyproject.toml || -n *.py(#qN^/) ]] && \
        is_python=true

    if [ "$is_python" = true ] && spaceship::is_git; then
        local git_root=$(git rev-parse --show-toplevel)
        local git_name="$git_root:t"

        if [ "$git_name" = "$pokey_venv" ]; then
            pokey_venv="✔"
        elif [ -z "$pokey_venv" ]; then
            color="red"
            pokey_venv="✕"
        fi
    fi

    # Add space if nonempty
    [ -n "$pokey_venv" ] && pokey_venv="$pokey_venv "

    spaceship::section \
        "$color" \
        "$SPACESHIP_POKEY_VENV_PREFIX" \
        "${SPACESHIP_POKEY_VENV_SYMBOL}${pokey_venv}" \
        "$SPACESHIP_POKEY_VENV_SUFFIX"
}
