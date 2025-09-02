#!/bin/bash
# Backup existing WAR if it exists
echo "BeforeInstall: backing up existing WAR..."
WAR_PATH="/usr/share/tomcat/webapps/sample.war"
if [ -f "$WAR_PATH" ]; then
    mv "$WAR_PATH" "${WAR_PATH}.bak.$(date +%F_%T)"
    echo "Existing WAR backed up."
else
    echo "No existing WAR found."
fi
