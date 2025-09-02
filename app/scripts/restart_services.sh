#!/bin/bash
# Restart Tomcat and Apache
echo "Restarting Tomcat and Apache..."
systemctl restart tomcat
systemctl restart httpd
echo "Services restarted."
