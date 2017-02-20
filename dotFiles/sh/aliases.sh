alias   ll='ls -alF'
alias   la='ls -A'
alias    l='ls -CF'
alias    h='ls'
alias   gs='git status'
alias   gd='zoom-run git diff'
alias   gp='git push origin HEAD'
alias  gpf='git push --force origin HEAD'
alias  gpl='git pull'
alias   ga='git add'
alias  gcm='git commit --amend'
alias gcam='git commit -a --amend'
alias   gm='git merge'
alias   gA='git add -A'
alias   hs='sudo salt-call --local state.highstate'
alias   vu='vim +PlugUpgrade +PlugUpdate +PlugClean +qall'
alias    k='cd ..'
alias    c='cd'
alias   vm='ssh vm'
alias   tl='zoom-run tldr'
alias   pr='git pull-request -b develop'
alias   sz='source ~/.zshrc'
alias  pie='pip install -e .'
alias  fff='git flow feature finish'
alias  ffp='git flow feature publish'
# From http://macsimplelife.blogspot.com/2007/11/mac-os-x-hibernate-issue.html
alias  hon='sudo pmset -a hibernatemode 25'
alias hoff='sudo pmset -a hibernatemode 3'
alias  ccp='cookiecutter https://github.com/audreyr/cookiecutter-pypackage.git'
alias   pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pysu='pyenv shell --unset'
alias   sp='python -c "import site; print(site.getsitepackages()[0])"'

# Run man zoomed if in a tmux pane
alias man='zoom-run man'

# Add an "alert" alias for long running commands.  Use like so:
#   foo; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
