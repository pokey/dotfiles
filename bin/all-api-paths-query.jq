# Extract necessary variables from the input json
.info.title as $service_name |
.basePath as $basePath |

# Then output one line per environment for the given input
["dev", "test", "demo"] |
.[] |
. as $env |

# Output http-prompt args
"https://\($service_name).\($env).globality.io\($basePath)" as $uri |
"'\($uri)' --spec='\($uri)/swagger'"
