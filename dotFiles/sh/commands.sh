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

# list git branches
go() {
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

bk() {
   file="$1"
   cp -rf "$file" "$file.bak"
}

bkm() {
   file="$1"
   mv "$file" "$file.bak"
}

aw() {
   profileName="$1"
   eval $(awsenvwrapper "$1")
}

awm() {
   profile_name="$1"
   eval $(awsmfa "$profile_name")
}

printargs() {
    for arg; do
        echo "$arg"
    done
}

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

pyn() {
   for last; do true; done
   name="$last"
   pyenv_new "$@"
   pyenv shell $name
}

# tags - search ctags
tags() {
  local line
  [ -e .tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' .tags |
    cut -c1-80 | fzf-tmux --nth=1,2
  ) && ${EDITOR:-vim} $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}
