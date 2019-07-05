_fzf_complete_awm() {
  _fzf_complete '+m -0 -1' "$@" < <(
    list-aws-profiles
  )
}

_fzf_complete_gd() {
  _fzf_complete '--ansi +m -0 -1' "$@" < <(
    git branch -vv --color
  )
}

_fzf_complete_gd_post() {
    target=$(cat)
    target_branch=$(echo "$target" | cut -d' ' -f2)
    [ "$target_branch" = "" ] && \
       target_branch=$(echo "$target" | cut -d' ' -f3)
    echo "$target_branch"
}

_fzf_complete_hp() {
  _fzf_complete '--ansi +m -0 -1' "$@" < <(
    all-api-paths
  )
}
