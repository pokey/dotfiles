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
  "grm"   'git rebase master'
  "grid"  'git rebase -i develop'
  "grim"  'git rebase -i master'
  "grh"   'git reset --hard'
  "grl"   'git reset --hard HEAD~'
  "grs"   'git reset --soft'
  "gpf"   'git push --force-with-lease origin HEAD'
  "grc"   'git rebase --continue'
  "gra"   'git rebase --abort'
  "gcp"   'git cherry-pick'
  "ghp"   'git subtree push --prefix dist origin master'
  "god"   'git checkout develop'
  "gom"   'git checkout master'
  "gco"   'git checkout'
  "gt"    'git ctags'
  "gct"   'git ctags'
  "gla"   'gl --branches --tags --remotes'
  "ix"    "| xargs"
  "ixx"   "| xargs -n1 -I{}"
  "ia"    "| rg"
  "ir"    "| rg"
  "ig"    "| rg"
  "ih"    "| head"
  "ic"    "| pbcopy"
  "iw"    "| wc -l"
  "ij"    "| jq '.__CURSOR__'"
  "ijc"   "| jq '.count'"
  "iji"   "| jq '.items[] | __CURSOR__'"
  "ijr"   "| jq -r '.__CURSOR__'"
  "ijf"   "| jq '[leaf_paths as \$path | {\"key\": \$path | join(\".\"), \"value\": getpath(\$path)}] | from_entries'"
  "ip"    "faketty __LINE__ | zoom-run"
  "cl"    "echo \"!!\" | pbcopy__EXPAND__"
  "lp"    "faketty !! | zoom-run__EXPAND__"
  "pl"    "faketty !! | zoom-run__EXPAND__"
  "tx"    "tar xzf"
  "tc"    "tar czf"
  "tt"    "tar tzf"
  "fi"    "git flow init"
  "ffs"   "git flow feature start"
  "ffn"   "git flow feature start"
  "ffp"   "git flow feature publish"
  "frs"   "git flow release start"
  "frp"   "git flow release publish"
  "nid"   "npm install -D"
  "ns"    "npm install -d"
  "pys"   "pyenv shell"
  "pyw"   'pyenv shell ${PWD##*/}__EXPAND__'
  "pynw"  'pyn ${PWD##*/}__EXPAND__'
  "pylw"  'pyenv local ${PWD##*/}__EXPAND__'
  "pyc"   'pyenv shell ${PWD##*/}__EXPAND__'
  "pi"    "pip install"
  "piu"   "pip install -U"
  "pu"    "pip uninstall"
  "pie"   "pip install -e ."
  "pis"   "pip install flake8 flake8-isort flake8-print mypy ipdb"
  "pisj"  "pip install flake8 flake8-isort flake8-print mypy ipdb jupyterlab"
  "pieu"  "pip install -e . -U"
  "gpie"  "gpip -e ."
  "gpu"   "gpip -U"
  "gpit"  "gpip -e '.[test]'"
  "gpieu" "gpip -e . -U"
  "gpir"  "gpip -r requirements.txt"
  "pir"   "pip install -r requirements.txt"
  "pf"    'pip freeze -l > requirements.txt'
  "gst"   "git stash"
  "gstp"  "git stash pop"
  "gn"    "git checkout -b"
  "gp"    "git push"
  "ga"    "git add"
  "gai"   "git add -i"
  "dp"    "dvc push"
  "dvpl"  "dvc pull"
  "dc"    "dvc commit"
  "ds"    "dvc status"
  "dr"    "dvc repro -R"
  "dr."   "dvc repro -R ."
  "pr"    "git pull-request -ocpb"
  "prd"   "git pull-request -ocpb develop"
  "prm"   "git pull-request -ocpb master"
  "prs"   "git pr show"
  "awd"   'eval $(awsdev)'
  "dl"    'eval $(aws ecr get-login --no-include-email)'
  "ev"    '$(__CURSOR__)'
  "evl"   '$(!!)__EXPAND__'
  "ppv"   "pip list | rg"
  "cg"    'cd $(git rev-parse --show-toplevel)__EXPAND__'
  "lf"    '!$__EXPAND__'
  "lc"    '!!:0__EXPAND__'
  "lw"    '!!__EXPAND__'
  "k9"    'kill -9 __EXPAND__'
  "hp"    'hp **__EXPAND__'
  "hpw"   'hp ${PWD##*/}__EXPAND_STAR__'
  "ghc"   'git rev-parse HEAD'
  "rf"    'rm -rf'
  "cs"    'cd ~/src'
  "cpr"   'cp -rf'
  "cf"    'cp -rf'
  "jl"    'jupyter lab'
  "vs"    'vim -S'
  "jo"    'jobs'
  "k1"    'kill %1'
  "k91"   'kill -9 %1'
  "nv"    'kill -9 %1 ; pyenv shell ${PWD##*/} ; nvim -S'
  "ya"    'yarn add'
  "idc"   'uuid | pbcopy'
  "ba"    'eval $(awsmfa administrator)'
  "bd"    'eval $(botoenv -p development)'
  "bml"   'eval $(botoenv -p machine-learning)'
  "bmlp"  'eval $(botoenv -p machine-learning-prod)'
  "bds"   'eval $(botoenv -p datascience)'
  "bp"    'eval $(botoenv -p production-readonly)'
  "bpad"  'eval $(botoenv -p prod-ai-developer)'
  "bpaa"  'eval $(botoenv -p prod-ai-admin)'
  "nose"  'python setup.py nosetests --failed'
  "dpl"   'docker pull'
  "db"    'docker run -it --entrypoint /bin/bash'
  "rp"    'rg --type py'
  "ua"    'unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN'
  "jti"   'jupytext --set-formats ipynb,py:percent'
  "ptv"   "http --verify=no 'https://miranda.prod.globality.io/api/health'| jq -r '.checks.taxonomies_version.message'"
  "h1"    "head -1"
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
    local MATCH MBEGIN MEND expansion expand expand_star line
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    line="$LBUFFER"
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
