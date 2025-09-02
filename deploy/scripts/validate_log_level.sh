#!/bin/bash
# Validate log level applied correctly
CONFIG_FILE="/usr/share/tomcat/webapps/config.properties"

if [ -f "$CONFIG_FILE" ]; then
    LOG_LEVEL=$(grep log_level "$CONFIG_FILE" | cut -d '=' -f2)
    echo "Current log level in config: $LOG_LEVEL"
else
    echo "Config file not found! Validation failed."
    exit 1
fi
