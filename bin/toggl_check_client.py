#!/usr/bin/env python3

import json
import subprocess
import sys
import urllib.error
import urllib.request
from base64 import b64encode
from pathlib import Path

# Read API token from the same place as the Talon plugin
API_TOKEN_PATH = Path("~/envs/toggl/TOGGL_API_TOKEN").expanduser()
API_TOKEN = API_TOKEN_PATH.read_text().strip()
WORKSPACE_ID = 8497458

# Client ID to kebab-case name mapping
CLIENT_MAPPING = {
    65532308: "bold",  # Bold client
    68179013: "brm",
}

# Create auth headers
headers = {
    "Content-Type": "application/json",
    "Authorization": "Basic " + b64encode(f"{API_TOKEN}:api_token".encode()).decode(),
}


def get_current_time_entry():
    """Get the current time entry or None if not tracking time"""
    url = "https://api.track.toggl.com/api/v9/me/time_entries/current"
    req = urllib.request.Request(url, headers=headers)
    try:
        with urllib.request.urlopen(req) as response:
            return json.loads(response.read().decode("utf-8"))
    except urllib.error.HTTPError as e:
        if e.code == 404:  # No current time entry
            return None
        raise


def get_project(project_id):
    """Get project details including client ID"""
    url = f"https://api.track.toggl.com/api/v9/workspaces/{WORKSPACE_ID}/projects/{project_id}"
    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req) as response:
        return json.loads(response.read().decode("utf-8"))


def show_client_picker():
    """Show a client picker and return the selected client name"""
    client_names = list(CLIENT_MAPPING.values())
    choices = client_names + ["None"]

    # Build AppleScript to show a dialog
    choices_str = '", "'.join(choices)
    script = f'''
    choose from list {{"{choices_str}"}} with prompt "Select a client:" default items {{"{choices[0]}"}}
    '''

    try:
        result = subprocess.run(
            ["osascript", "-e", script],
            capture_output=True,
            text=True,
            check=True
        )
        selected = result.stdout.strip()

        # User cancelled or selected "None"
        if selected == "false" or selected == "None":
            return None

        return selected
    except subprocess.CalledProcessError:
        return None


def main():
    try:
        current_entry = get_current_time_entry()

        # If no active time entry
        if current_entry is None:
            sys.exit(1)

        # Get project ID from current entry
        project_id = current_entry.get("project_id")
        if project_id is None:
            # No project assigned to time entry
            sys.exit(1)

        # Get project details including client ID
        try:
            project = get_project(project_id)
            client_id = project.get("client_id")
        except Exception as e:
            print(f"Error fetching client: {e}", file=sys.stderr)
            # Show client picker on error
            selected_client = show_client_picker()
            if selected_client:
                print(selected_client)
                sys.exit(0)
            else:
                sys.exit(1)

        # Check if this client is in our tracking list
        if client_id in CLIENT_MAPPING:
            # Output the client name and exit successfully
            print(CLIENT_MAPPING[client_id])
            sys.exit(0)
        else:
            print(f"Unknown client ID: {client_id}", file=sys.stderr)
            # Not tracking time for a monitored client
            sys.exit(1)
    except Exception as e:
        print(f"Error checking Toggl status: {e}", file=sys.stderr)
        # Show client picker on any error
        selected_client = show_client_picker()
        if selected_client:
            print(selected_client)
            sys.exit(0)
        else:
            sys.exit(1)


if __name__ == "__main__":
    main()
