# From http://stackoverflow.com/a/28641065/2605678
setopt extendedglob
typeset -Ag abbreviations
abbreviations=(
  "gc"    "git commit -m \"__CURSOR__\""
  "gca"   "git commit -am \"__CURSOR__\""
  "gcm"   'git commit --amend'
  "gcam"  'git commit -a --amend'
  "gm"    'git merge'
  "gp"    'git push origin HEAD'
  "gpf"   'git push --force origin HEAD'
  "grc"   'git rebase --continue'
  "gcp"   'git cherry-pick'
  "ix"    "| xargs"
  "ia"    "| ag"
  "ih"    "| head"
  "tx"    "tar -xzvf"
  "tc"    "tar -czvf"
  "fi"    "git flow init"
  "ffs"   "git flow feature start"
  "ffn"   "git flow feature start"
  "ffp"   "git flow feature publish"
  "fff"   "git flow feature finish"
  "nd"    "npm install -D"
  "ns"    "npm install -d"
  "pys"   "pyenv shell"
  "pi"    "pip install"
  "pie"   "pip install -e ."
  "gn"    "git checkout -b"
  "gp"    "git push"
  "ga"    "git add"
  "pr"    "git pull-request -b"
  "awd"   'eval $(awsdev)'
  "ev"    '$(__CURSOR__)'
  "evl"   '$(!!)'
  "ppv"   "pip freeze -l | ag"
  "cg"    'cd $(git rev-parse --show-toplevel)'
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    command=${abbreviations[$MATCH]}
    LBUFFER+=${command:-$MATCH}

    if [[ "${command}" =~ "__CURSOR__" ]]
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

bindkey -s 'lf ' '!$\t'
bindkey -s 'lc ' '!!:0\t'
bindkey -s 'l1 ' '!!:1\t'
bindkey -s 'l2 ' '!!:2\t'
bindkey -s 'l3 ' '!!:3\t'
