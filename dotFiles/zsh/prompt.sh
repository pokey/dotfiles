# Git prompt
source ~/zsh-git-prompt/zshrc.sh

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        echo "${VIRTUAL_ENV##*/}"
    else
        echo "NONE"
        # In case you don't have one activated
    fi
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

export ZSH_THEME_GIT_PROMPT_PREFIX="|"
export ZSH_THEME_GIT_PROMPT_SUFFIX=""
export PROMPT='%B$(virtualenv_info)%~%b$(git_super_status)%# '
