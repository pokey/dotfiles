alias l='eza --classify --group-directories-first'
alias ll="eza $EXA_LA_OPTIONS"
alias la="eza -a"
alias lla="eza -a $EXA_LA_OPTIONS"
alias lal="eza -a $EXA_LA_OPTIONS"
alias gs='git status'
alias gd='zoom-run -p git diff'
alias gdp='zoom-run -p git diff head~'
alias gdh='zoom-run -p git diff head'
alias ghc='git rev-parse HEAD'
alias gf='git fetch'
alias gp='git push origin HEAD'
alias g-='git checkout -'
alias gpf='git push --force-with-lease origin HEAD'
alias gpl='git pull'
alias gcm='git commit --amend'
alias gcam='git commit -a --amend'
alias grd='git rebase develop'
alias grmr='git rebase master'
alias grid='git rebase -i develop'
alias grim='git rebase -i main'
alias grimr='git rebase -i master'
alias grc='git rebase --continue'
alias god='git checkout develop'
alias gom='git checkout main'
alias gomr='git checkout master'
alias grl='git reset --hard HEAD~'
alias ghp='git subtree push --prefix dist origin main'
alias gct='git ctags'
alias gai='git add -i'
alias gA='git add -A'
alias gdl='git log --graph --color=always --format="%C(auto)%h%d %s %C(green)(%cr) %C(bold blue)<%an>%Creset"'
alias gl='git-branchless smartlog'
alias ds='dvc status'
alias dc='dvc commit'
alias dvpl='dvc pull'
alias dp='dvc push'
alias hs='sudo salt-call --local state.highstate'
alias vu='vim +PlugUpgrade +PlugUpdate +PlugClean +qall'
alias pis='pip install flake8 flake8-isort flake8-print mypy ipdb'
alias pup='pip install --upgrade pip'
alias pisj='pip install flake8 flake8-isort flake8-print mypy ipdb jupyterlab'
alias k='cd ..'
alias kk='cd ../..'
alias kkk='cd ../../..'
alias k2='cd ../..'
alias k3='cd ../../..'
alias k4='cd ../../../..'
alias c='cd'
alias c-='cd -'
alias vm='ssh vm'
alias tl='zoom-run -p tldr'
alias prd='git pull-request -ocpb develop'
alias prm='git pull-request -ocpb main'
alias prmr='git pull-request -ocpb master'
alias prs='git pr show'
alias sz='source ~/.zshrc'
alias pie='pip install -e .'
alias pieu='pip install -e . -U'
alias jl='jupyter lab'
alias gpie='gpip -e .'
alias gpit="gpip -e '.[test]'"
alias pir="pip install -r requirements.txt"
alias gpir="gpip -r requirements.txt"
alias gst="git stash"
alias gstp="git stash pop"
alias gpieu='gpip -e . -U'
alias ffp='git flow feature publish'
alias frp='git flow release publish'
# From http://macsimplelife.blogspot.com/2007/11/mac-os-x-hibernate-issue.html
alias hon='sudo pmset -a hibernatemode 25'
alias hoff='sudo pmset -a hibernatemode 3'
alias ccp='cookiecutter https://github.com/audreyr/cookiecutter-pypackage.git'
alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pysu='pyenv shell --unset'
alias sp='python -c "import site; print(site.getsitepackages()[0])"'
alias cg='cd $(git rev-parse --show-toplevel)'
alias cs='cd ~/src'
alias le='zoom-run -p $PAGER'
alias p='zoom-run -p $PAGER'
alias vc="$VIMCAT"
alias vs="vim -S"
alias jo="jobs"
alias k1="kill %1"
alias k91="kill -9 %1"
alias uuid="python -c \"import uuid; print(uuid.uuid4())\" | tr -d '\n'"
alias np="mp"
alias hp="PYENV_VERSION=http-prompt pyenv exec http-prompt"
alias http="PYENV_VERSION=httpie pyenv exec http"
alias csvcut="PYENV_VERSION=csvkit pyenv exec csvcut"
alias csvjson="PYENV_VERSION=csvkit pyenv exec csvjson"
alias in2csv="PYENV_VERSION=csvkit pyenv exec in2csv"
alias csvlook="PYENV_VERSION=csvkit pyenv exec csvlook"
alias cookiecutter="PYENV_VERSION=cookiecutter cookiecutter"
alias yaml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"
alias nose="python setup.py nosetests --failed"
alias aws="PYENV_VERSION=aws pyenv exec aws"
alias things-cli="PYENV_VERSION=things3-api things-cli"
alias botoenv="PYENV_VERSION=botoenv pyenv exec botoenv"
alias nd="notify-on-complete"
alias dr.="dvc repro -R ."
alias ua="unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN"
alias random-task='PYENV_VERSION=things3-api things-cli --json next | jq -r ".[].uuid" | shuf -n1 | xargs -I{} open "things:///show?id={}"'
alias fastlane="bundle exec fastlane"
alias zd="/Applications/Zotero.app/Contents/MacOS/zotero -ZoteroDebugText -purgecaches -jsconsole"
alias to-string="jq -Rs"
alias gra="git rebase --abort"
alias gma="git merge --abort"
alias upgrade-branchless="cargo install --locked --git https://github.com/arxanas/git-branchless git-branchless"

# Run man zoomed if in a tmux pane
alias man='zoom-run -p man'

# Add an "alert" alias for long running commands.  Use like so:
#   foo; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias install-local='vsce package -o bundle.vsix && code --install-extension bundle.vsix'
alias tag-version="cat package.json | jq -r '.version' | xargs -I{} git tag -am {} {}"
alias publish-extension="vsce publish && npx ovsx publish -p $(cat ~/envs/openvsx/OPEN_VSX_TOKEN)"

alias patch-from-talon="git -C ../cursorless-talon format-patch -k main --stdout | git am -3k --directory=cursorless-talon"
