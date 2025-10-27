# Adding a New Toggl Client

To add support for a new client:

1. **Add client mapping** in `bin/toggl_check_client.py`:

   ```python
   CLIENT_MAPPING = {
       65532308: "bold",  # Bold client
       12345678: "spaghetti-corp",  # New client
   }
   ```

2. **Create environment directory**:

   ```bash
   CLIENT_NAME="spaghetti-corp"
   mkdir -p "$HOME/envs/$CLIENT_NAME/anthropic"
   echo "your-api-key" > "$HOME/envs/$CLIENT_NAME/anthropic/ANTHROPIC_API_KEY"
   ```

3. **Set up Claude config**:
   With the new client active on Toggl, run:
   ```bash
   claude
   # Configure Claude settings for this client
   ```

The scripts will automatically use the new client when active on Toggl.
