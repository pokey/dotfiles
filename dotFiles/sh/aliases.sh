# eza (ls replacement)
alias l='eza --classify --group-directories-first'
alias ll="eza $EXA_LA_OPTIONS"
alias la="eza -a"
alias lla="eza -a $EXA_LA_OPTIONS"
alias lal="eza -a $EXA_LA_OPTIONS"

# Git - status/diff
alias gs='git status'
alias gd='zoom-run -p git diff'
alias gdp='zoom-run -p git diff head~'
alias gdh='zoom-run -p git diff head'
alias gdl='git log --graph --color=always --format="%C(auto)%h%d %s %C(green)(%cr) %C(bold blue)<%an>%Creset"'
alias gl='git-branchless smartlog'

# Git - fetch/pull/push
alias gf='git fetch'
alias gp='git push origin HEAD'
alias gpf='git push --force-with-lease origin HEAD'
alias gpl='git pull'

# Git - commit
alias gcm='git commit --amend'
alias gcam='git commit -a --amend'

# Git - rebase
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias grim='git rebase -i main'

# Git - checkout
alias g-='git checkout -'
alias gom='git checkout main'

# Git - reset
alias grl='git reset --hard HEAD~'

# Git - stash
alias gst="git stash"
alias gstp="git stash pop"

# Git - other
alias gA='git add -A'
alias gma="git merge --abort"
alias upgrade-branchless="cargo install --locked --git https://github.com/arxanas/git-branchless git-branchless"

# Navigation
alias k='cd ..'
alias kk='cd ../..'
alias kkk='cd ../../..'
alias k2='cd ../..'
alias k3='cd ../../..'
alias k4='cd ../../../..'
alias c='cd'
alias c-='cd -'
alias cg='cd $(git rev-parse --show-toplevel)'
alias cs='cd ~/src'

# Shell
alias sz='source ~/.zshrc'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# LLM tools
alias claude="run-claude.sh"
alias gemini="run-gemini.sh"
alias llm="autoenv llm"
alias s="sketch"

# VSCode extensions
alias install-local='vsce package -o bundle.vsix && code --install-extension bundle.vsix'
alias tag-version="cat package.json | jq -r '.version' | xargs -I{} git tag -am {} {}"
alias publish-extension="vsce publish && npx ovsx publish -p $(cat ~/envs/openvsx/OPEN_VSX_TOKEN)"

# Cursorless dev
alias patch-from-talon="git -C ../cursorless-talon format-patch -k main --stdout | git am -3k --directory=cursorless-talon"

# Misc
alias to-string="jq -Rs"
alias uuid="python -c \"import uuid; print(uuid.uuid4())\" | tr -d '\n'"
