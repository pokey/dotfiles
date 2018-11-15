# Custom prompt sections
source ~/.zsh/prompt/sections/pokey_venv.sh

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Spaceship prompt
export SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  pokey_venv    # Pokey custom virtualenv section
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  conda         # conda virtualenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_DEFAULT_PREFIX=''
export SPACESHIP_GIT_PREFIX=''
export SPACESHIP_GIT_STATUS_COLOR='124'
export SPACESHIP_DIR_PREFIX=''
export SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
export SPACESHIP_PACKAGE_PREFIX=''
