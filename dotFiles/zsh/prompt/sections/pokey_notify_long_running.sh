#
# Pokey notify long running
#
# Notify if a command takes more than a certain amount of time.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_POKEY_NOTIFY_LONG_RUNNING_SHOW="${SPACESHIP_POKEY_NOTIFY_LONG_RUNNING_SHOW=true}"
SPACESHIP_POKEY_NOTIFY_LONG_RUNNING_ELAPSED="${SPACESHIP_POKEY_NOTIFY_LONG_RUNNING_ELAPSED=10}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_pokey_notify_long_running() {
  [[ $SPACESHIP_POKEY_NOTIFY_LONG_RUNNING_SHOW == false ]] && return

  if [[ $SPACESHIP_EXEC_TIME_duration -ge $SPACESHIP_POKEY_NOTIFY_LONG_RUNNING_ELAPSED ]]; then
      terminal-notifier -message Done -activate io.alacritty
  fi
}
