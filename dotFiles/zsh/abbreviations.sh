# From http://stackoverflow.com/a/28641065/2605678
setopt extendedglob
typeset -Ag abbreviations
abbreviations=(
  "gc"    "git commit -m \"__CURSOR__\""
  "gca"   "git commit -am \"__CURSOR__\""
  "gcm"   'git commit --amend'
  "gcam"  'git commit -a --amend'
  "gcl"   'pbpaste | xargs git clone'
  "gm"    'git merge'
  "gp"    'git push origin HEAD'
  "gb"    'git branch'
  "gf"    'git fetch'
  "gr"    'git rebase'
  "gri"   'git rebase -i'
  "grd"   'git rebase develop'
  "grid"  'git rebase -i develop'
  "grh"   'git reset --hard'
  "grs"   'git reset --soft'
  "gpf"   'git push --force origin HEAD'
  "grc"   'git rebase --continue'
  "gcp"   'git cherry-pick'
  "ghp"   'git subtree push --prefix dist origin master'
  "god"   'git checkout develop'
  "gt"    'git ctags'
  "gct"   'git ctags'
  "ix"    "| xargs"
  "ixx"   "| xargs -n1 -I{}"
  "ia"    "| ag"
  "ih"    "| head"
  "tx"    "tar xzf"
  "tc"    "tar czf"
  "tt"    "tar tzf"
  "fi"    "git flow init"
  "ffs"   "git flow feature start"
  "ffn"   "git flow feature start"
  "ffp"   "git flow feature publish"
  "frs"   "git flow release start"
  "frp"   "git flow release publish"
  "nd"    "npm install -D"
  "ns"    "npm install -d"
  "pys"   "pyenv shell"
  "pi"    "pip install"
  "pie"   "pip install -e ."
  "pis"   "pip install flake8 flake8-isort flake8-print"
  "pisj"  "pip install flake8 flake8-isort flake8-print jupyterlab"
  "gpie"  "gpip -e ."
  "gn"    "git checkout -b"
  "gp"    "git push"
  "ga"    "git add"
  "gai"   "git add -i"
  "pr"    "git pull-request -b"
  "awd"   'eval $(awsdev)'
  "awm"   'eval $(awsmfa __CURSOR__)'
  "ev"    '$(__CURSOR__)'
  "evl"   '$(!!)__EXPAND__'
  "ppv"   "pip freeze -l | ag"
  "cg"    'cd $(git rev-parse --show-toplevel)__EXPAND__'
  "lf"    '!$__EXPAND__'
  "lc"    '!!:0__EXPAND__'
  "k9"    'kill -9 __EXPAND__'
  "ghc"   'git rev-parse HEAD'
  "rf"    'rm -rf'
  "cs"    'cd ~/src'
  "cpr"   'cp -rf'
  "cf"    'cp -rf'
)

for i in {1..9};
do
   abbreviations+=("l$i" "!!:${i}__EXPAND__")
done

for i in {1..9};
do
   abbreviations+=("l${i}f" "!-${i}\$__EXPAND__")
   abbreviations+=("l${i}c" "!-${i}:0__EXPAND__")
   for j in {1..9};
   do
      abbreviations+=("l${i}${j}" "!-${i}:${j}__EXPAND__")
   done
done

magic-abbrev-expand() {
    local MATCH MBEGIN MEND expansion expand
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    expansion=${abbreviations[$MATCH]}

    if [[ "${expansion}" == *__EXPAND__ ]]
    then
       expand=true
       expansion=${expansion%%__EXPAND__}
    fi

    LBUFFER+=${expansion:-$MATCH}

    [[ "$expand" ]] && zle fzf-completion

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
