#!/bin/bash
# Set permissions for WAR
echo "AfterInstall: setting permissions..."
WAR_PATH="/usr/share/tomcat/webapps/sample.war"
chown tomcat:tomcat "$WAR_PATH"
chmod 644 "$WAR_PATH"
echo "Permissions set."
