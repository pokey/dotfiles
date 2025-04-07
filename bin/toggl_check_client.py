#!/usr/bin/env python3

import json
import sys
from base64 import b64encode
from pathlib import Path

import requests

# Read API token from the same place as the Talon plugin
API_TOKEN_PATH = Path("~/envs/toggl/TOGGL_API_TOKEN").expanduser()
API_TOKEN = API_TOKEN_PATH.read_text().strip()
WORKSPACE_ID = 8497458

# Bold client ID
BOLD_CLIENT_ID = 65532308

# Create auth headers
headers = {
    "Content-Type": "application/json",
    "Authorization": "Basic " + b64encode(f"{API_TOKEN}:api_token".encode()).decode(),
}

def get_current_time_entry():
    """Get the current time entry or None if not tracking time"""
    url = "https://api.track.toggl.com/api/v9/me/time_entries/current"
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()

def get_project(project_id):
    """Get project details including client ID"""
    url = f"https://api.track.toggl.com/api/v9/workspaces/{WORKSPACE_ID}/projects/{project_id}"
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()

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
        project = get_project(project_id)
        client_id = project.get("client_id")
        
        # Check if this is the Bold client
        if client_id == BOLD_CLIENT_ID:
            # On the clock for Bold client
            sys.exit(0)
        else:
            # Not on Bold client time
            sys.exit(1)
    except Exception as e:
        print(f"Error checking Toggl status: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
