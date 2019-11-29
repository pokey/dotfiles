# Generate one line per environment
. + {env: ["dev", "test", "demo", "prod"][]}

# Generate url
| "https://\(.info.title).\(.env).globality.io\(.basePath)"

# Output http-prompt args
| "--env <(echo \"--verify no\") '\(.)' --spec=<(http --verify no '\(.)/swagger')"
