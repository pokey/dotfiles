# Quick jump to recently used directory
j() {
   local dir
   dir="$(fasd -Rdl "$1" | fzf-tmux -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# Quick open in vim
v() {
  local file
  file="$(fasd -Rfl "$1" | fzf-tmux -1 -0 --no-sort +m)" && vim "${file}" || return 1
}

# go - checkout git branch
go() {
  local branches branch
  branches=$(git branch -vv --color)
  branch=$(echo "$branches" | fzf-tmux --ansi -n 1 +m -0 -1 -q "$1")
  if test "$?" = "0"; then
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  fi
}

# list git branches
gb() {
  local branches branch out key
  branches=$(git branch -vv --color)
  out=$(echo "$branches" | fzf-tmux --ansi -n 1 +m -0 -q "$1" --expect=ctrl-d)
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
gl() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
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
