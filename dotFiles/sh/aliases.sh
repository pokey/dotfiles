alias    l='exa'
alias   ll="exa $EXA_LA_OPTIONS"
alias   la="exa -a"
alias  lla="exa -a $EXA_LA_OPTIONS"
alias  lal="exa -a $EXA_LA_OPTIONS"
alias   lt="exa --tree --git-ignore $EXA_LA_OPTIONS"
alias   gs='git status'
alias   gd='zoom-run git diff'
alias  gdp='zoom-run git diff head~'
alias  gdh='zoom-run git diff head'
alias  ghc='git rev-parse HEAD'
alias   gf='git fetch'
alias   gp='git push origin HEAD'
alias   g-='git checkout -'
alias  gpf='git push --force origin HEAD'
alias  gpl='git pull'
alias  gcm='git commit --amend'
alias gcam='git commit -a --amend'
alias  grd='git rebase develop'
alias grid='git rebase -i develop'
alias  grc='git rebase --continue'
alias  god='git checkout develop'
alias  ghp='git subtree push --prefix dist origin master'
alias  gct='git ctags'
alias   gt='git ctags'
alias  gai='git add -i'
alias   gA='git add -A'
alias   hs='sudo salt-call --local state.highstate'
alias   vu='vim +PlugUpgrade +PlugUpdate +PlugClean +qall'
alias  pis='pip install flake8 flake8-isort flake8-print jupyterlab'
alias    k='cd ..'
alias    c='cd'
alias   c-='cd -'
alias   vm='ssh vm'
alias   tl='zoom-run tldr'
alias   pr='git pull-request -b develop'
alias   sz='source ~/.zshrc'
alias  pie='pip install -e .'
alias gpie='gpip -e .'
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
alias less='zoom-run $PAGER'
alias   le='zoom-run $PAGER'
alias    p='zoom-run $PAGER'

# Run man zoomed if in a tmux pane
alias man='zoom-run man'

# Add an "alert" alias for long running commands.  Use like so:
#   foo; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
