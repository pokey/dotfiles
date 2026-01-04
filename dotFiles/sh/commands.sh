# Quick jump to recently used directory
j() {
   local dir
   dir="$(fasd -Rdl "$1" | fzf-tmux -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# list git branches with fzf
g() {
  local branches branch out key
  branches=$(git branch -vv --color --sort=-committerdate)
  out=$(echo "$branches" | fzf-tmux --ansi -n 1 +m -0 -1 -q "$1" --expect=ctrl-d)
  if test "$?" = "0"; then
    key=$(head -1 <<< "$out")
    branch=$(head -2 <<< "$out" | tail -1 | awk '{print $1}' | sed "s/.* //")
    case "$key" in
       ctrl-d) git branch -d $branch ;;
            *) git checkout $branch ;;
    esac
  fi
}

# git commit browser
glt() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(green)(%cr) %C(bold blue)<%an>%Creset" "$@" |
  fzf-tmux --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind "ctrl-m:execute:
                echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R'"
}

# Mkdir and change to it
mc() {
   mkdir $1
   cd $1
}

# Backup file
bk() {
   file="$1"
   cp -rf "$file" "$file.bak"
}

# Backup file (move)
bkm() {
   file="$1"
   mv "$file" "$file.bak"
}

# Print arguments (debugging helper)
printargs() {
    for arg; do
        echo "$arg"
    done
}

# Fake tty for commands that need it
faketty() {
    cmd="$1"
    if alias "$cmd" > /dev/null; then
        output=$(alias "$cmd")
        output=${output/#$cmd=\'/}
        output=${output/%\'/}
        cmd=$output
    fi
    shift
    script -q /dev/null ${=cmd} $@
}

# Get tree hash for a commit
tree-hash() {
    git cat-file -p $(git rev-parse "$1") | head -1 | cut -d' ' -f2
}

# AWS MFA wrapper
awm() {
   profile_name="$1"
   unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
   eval $(awsmfa "$profile_name")
}
