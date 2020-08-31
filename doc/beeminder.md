# Beeminder

I have a script that uses `launchctl` to automatically updates beeminder every
day.  It requires some manual setup:

1. Set up a pyenv virtualenv:

        pyn things3-api
        pip install things3-api
        pip install argcomplete

1. Set up a pyenv virtualenv for `goals`

        git clone git@github.com:pokey/goals.git
        cd goals
        pyn goals
        pip install -e .

1. Set up an envdir in `~/envs/beeminder` containing `BEEMINDER_AUTH_TOKEN`
   and `BEEMINDER_USER` from [here](https://www.beeminder.com/api/v1/auth_token.json).

1. Create something like the following in
   `~/Library/LaunchAgents/com.pokeyrule.update-tasks-beeminder.plist`:

        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
            <key>Disabled</key>
            <false/>
            <key>Label</key>
            <string>com.pokeyrule.update-tasks-beeminder</string>
            <key>ProgramArguments</key>
            <array>
                <string>/Users/pokey/src/dotfiles/bin/update-tasks-beeminder</string>
            </array>
            <key>StandardErrorPath</key>
            <string>/Users/pokey/.logs/update-tasks-beeminder.error.txt</string>
            <key>StandardOutPath</key>
            <string>/Users/pokey/.logs/update-tasks-beeminder.log.txt</string>
            <key>StartCalendarInterval</key>
            <array>
              <dict>
                  <key>Hour</key>
                  <integer>7</integer>
                  <key>Minute</key>
                  <integer>0</integer>
              </dict>
            </array>
        </dict>
        </plist>
