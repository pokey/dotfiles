alias    l='exa --classify --group-directories-first'
alias   ll="exa $EXA_LA_OPTIONS"
alias   la="exa -a"
alias  lla="exa -a $EXA_LA_OPTIONS"
alias  lal="exa -a $EXA_LA_OPTIONS"
alias   gs='git status'
alias   gd='zoom-run -p git diff'
alias  gdp='zoom-run -p git diff head~'
alias  gdh='zoom-run -p git diff head'
alias  ghc='git rev-parse HEAD'
alias   gf='git fetch'
alias   gp='git push origin HEAD'
alias   g-='git checkout -'
alias  gpf='git push --force origin HEAD'
alias  gpl='git pull'
alias  gcm='git commit --amend'
alias gcam='git commit -a --amend'
alias  grd='git rebase develop'
alias  grm='git rebase master'
alias grid='git rebase -i develop'
alias grim='git rebase -i master'
alias  grc='git rebase --continue'
alias  god='git checkout develop'
alias  gom='git checkout master'
alias  grl='git reset --hard HEAD~'
alias  ghp='git subtree push --prefix dist origin master'
alias  gct='git ctags'
alias   gt='git ctags'
alias  gai='git add -i'
alias   gA='git add -A'
alias   hs='sudo salt-call --local state.highstate'
alias   vu='vim +PlugUpgrade +PlugUpdate +PlugClean +qall'
alias  pis='pip install flake8 flake8-isort flake8-print mypy ipdb'
alias  pup='pip install --upgrade pip'
alias pisj='pip install flake8 flake8-isort flake8-print mypy ipdb jupyterlab'
alias    k='cd ..'
alias   kk='cd ../..'
alias  kkk='cd ../../..'
alias   k2='cd ../..'
alias   k3='cd ../../..'
alias   k4='cd ../../../..'
alias    c='cd'
alias   c-='cd -'
alias   vm='ssh vm'
alias   tl='zoom-run -p tldr'
alias  prd='git pull-request -ocpb develop'
alias  prm='git pull-request -ocpb master'
alias  prs='git pr show'
alias   sz='source ~/.zshrc'
alias  pie='pip install -e .'
alias pieu='pip install -e . -U'
alias   jl='jupyter lab'
alias gpie='gpip -e .'
alias gpit="gpip -e '.[test]'"
alias  pir="pip install -r requirements.txt"
alias gpir="gpip -r requirements.txt"
alias  gst="git stash"
alias gstp="git stash pop"
alias gpieu='gpip -e . -U'
alias  ffp='git flow feature publish'
alias  frp='git flow release publish'
# From http://macsimplelife.blogspot.com/2007/11/mac-os-x-hibernate-issue.html
alias  hon='sudo pmset -a hibernatemode 25'
alias hoff='sudo pmset -a hibernatemode 3'
alias  ccp='cookiecutter https://github.com/audreyr/cookiecutter-pypackage.git'
alias   pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pysu='pyenv shell --unset'
alias   sp='python -c "import site; print(site.getsitepackages()[0])"'
alias   cg='cd $(git rev-parse --show-toplevel)'
alias   cs='cd ~/src'
alias   le='zoom-run -p $PAGER'
alias    p='zoom-run -p $PAGER'
alias   vc="$VIMCAT"
alias   vs="vim -S"
alias   jo="jobs"
alias   k1="kill %1"
alias  k91="kill -9 %1"
alias uuid="python -c \"import uuid; print(uuid.uuid4())\" | tr -d '\n'"
alias   np="mp"
alias http="pyenv-http"
alias csvcut="csvkit-run csvcut"
alias yaml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"
alias nose="python setup.py nosetests --failed"
alias  aws="PYENV_VERSION=aws pyenv exec aws"
alias botoenv="PYENV_VERSION=botoenv pyenv exec botoenv"
alias nd="notify-on-complete"

# Run man zoomed if in a tmux pane
alias man='zoom-run -p man'

# Add an "alert" alias for long running commands.  Use like so:
#   foo; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
