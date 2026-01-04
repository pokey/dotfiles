#!/bin/zsh
# From http://stackoverflow.com/a/28641065/2605678
setopt extendedglob
typeset -Ag abbreviations
abbreviations=(
  # Git - commits
  "gc"    "git commit -m \"__CURSOR__\""
  "gca"   "git commit -am \"__CURSOR__\""
  "gcm"   'git commit --amend'
  "gcf"   'git commit --fixup'
  "gcam"  'git commit -a --amend'
  "gcl"   'pbpaste | xargs git clone'
  # Git - branches
  "gm"    'git merge'
  "gb"    'git branch'
  "gn"    "git checkout -b"
  "gco"   'git checkout'
  "god"   'git checkout develop'
  "gom"   'git checkout main'
  "gdh"   'git checkout --detach head'
  # Git - push/pull/fetch
  "gp"    'git push origin HEAD'
  "gpf"   'git push --force-with-lease origin HEAD'
  "gf"    'git fetch'
  # Git - rebase
  "gr"    'git rebase'
  "gri"   'git rebase -i'
  "grim"  'git rebase -i main'
  "grqm"  'git rebase -i --autosquash main'
  "grq"  'git rebase -i --autosquash'
  "grc"   'git rebase --continue'
  "gra"   'git rebase --abort'
  # Git - reset
  "grh"   'git reset --hard'
  "grl"   'git reset --hard HEAD~'
  "grs"   'git reset --soft'
  "grm"   'git reset --mixed'
  # Git - other
  "gma"   'git merge --abort'
  "gcp"   'git cherry-pick'
  "ghr"   'git hide -r'
  "gls"   "git-branchless smartlog 'stack(__CURSOR__)'"
  "gst"   "git stash"
  "gstp"  "git stash pop"
  "ga"    "git add"
  "gap"   "git add -p"
  # Pipe shortcuts
  "ix"    "| xargs"
  "ixx"   "| xargs -n1 -I{}"
  "ir"    "| rg"
  "ih"    "| head"
  "ic"    "| pbcopy"
  "iw"    "| wc -l"
  "ij"    "| jq '.__CURSOR__'"
  "ijr"   "| jq -r '.__CURSOR__'"
  # History shortcuts
  "cl"    "echo \"!!\" | pbcopy__EXPAND__"
  "ev"    '$(__CURSOR__)'
  "evl"   '$(!!)__EXPAND__'
  "lf"    '!$__EXPAND__'
  "lc"    '!!:0__EXPAND__'
  "lw"    '!!__EXPAND__'
  # Tar
  "tx"    "tar xzf"
  "tc"    "tar czf"
  "tt"    "tar tzf"
  # Navigation
  "cg"    'cd $(git rev-parse --show-toplevel)__EXPAND__'
  "cs"    'cd ~/src'
  # File operations
  "rf"    'rm -rf'
  "cpr"   'cp -rf'
  # Jobs
  "k9"    'kill -9 __EXPAND__'
  "jo"    'jobs'
  "k1"    'kill %1'
  "k91"   'kill -9 %1'
  # Misc
  "h1"    "head -1"
  "idc"   'uuid | pbcopy'
  "rp"    'rg --type py'
  "ua"    'unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN'
  # LLM
  "il"    '| envdir ~/envs/openai llm -s "__CURSOR__"'
  "lm"    'envdir ~/envs/openai llm'
  "s"    'sketch'
  "sp"   'sketch -prompt "__CURSOR__"'
)

for i in {1..9};
do
   abbreviations+=("l$i" "!!:${i}__EXPAND__")
done

for i in {1..9};
do
   abbreviations+=("l${i}f" "!-${i}\$__EXPAND__")
   abbreviations+=("l${i}w" "!-${i}__EXPAND__")
   abbreviations+=("l${i}c" "!-${i}:0__EXPAND__")
   for j in {1..9};
   do
      abbreviations+=("l${i}${j}" "!-${i}:${j}__EXPAND__")
   done
done

magic-abbrev-expand() {
    local MATCH MBEGIN MEND expansion expand expand_star line original_buffer
    original_buffer="$LBUFFER"
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    line="$LBUFFER"
    
    # Don't expand if preceded by word character or dash
    if [[ $MBEGIN -gt 1 && "${original_buffer[MBEGIN-1]}" =~ [_a-zA-Z0-9-] ]]; then
        LBUFFER="${original_buffer} "
        return
    fi
    
    expansion=${abbreviations[$MATCH]}

    if [[ "${expansion}" == *__EXPAND__ ]]
    then
       expand=true
       expansion=${expansion%%__EXPAND__}
    fi

    if [[ "${expansion}" == *__EXPAND_STAR__ ]]
    then
       expand=true
       expand_star=true
       expansion=${expansion%%__EXPAND_STAR__}
    fi

    if [[ "${expansion}" =~ "__LINE__" ]]
    then
        LBUFFER="${expansion[(ws:__LINE__:)1]}$line${expansion[(ws:__LINE__:)2]}"
    else
        LBUFFER+=${expansion:-$MATCH}
    fi

    [[ "$expand" ]] && zle fzf-completion

    if [[ "$expand_star" ]] ; then
        LBUFFER+="**"
        zle fzf-completion
    fi

    if [[ "${expansion}" =~ "__CURSOR__" ]]
    then
        RBUFFER=${LBUFFER[(ws:__CURSOR__:)2]}
        LBUFFER=${LBUFFER[(ws:__CURSOR__:)1]}
    else
        zle self-insert
    fi
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert
