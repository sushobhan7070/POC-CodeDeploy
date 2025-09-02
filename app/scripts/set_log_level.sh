#!/bin/bash
# Set application log level from SSM Parameter Store

# Ensure ENV is exported or passed as environment variable
if [ -z "$ENV" ]; then
    echo "ENV variable not set! Exiting."
    exit 1
fi

SSM_PARAM="/POC-CodeDeploy-${ENV}/log_level"
LOG_LEVEL=$(aws ssm get-parameter --name "$SSM_PARAM" --query "Parameter.Value" --output text --region ap-south-1)

if [ -z "$LOG_LEVEL" ]; then
    echo "Failed to fetch log level from SSM! Using default INFO."
    LOG_LEVEL="INFO"
fi

CONFIG_FILE="/usr/share/tomcat/webapps/config.properties"
echo "log_level=${LOG_LEVEL}" > "$CONFIG_FILE"
chown tomcat:tomcat "$CONFIG_FILE"
chmod 644 "$CONFIG_FILE"
echo "Log level set to $LOG_LEVEL in $CONFIG_FILE"
