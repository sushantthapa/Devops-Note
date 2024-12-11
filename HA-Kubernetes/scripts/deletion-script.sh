#!/bin/bash

# Define the application name pattern
app_name_pattern="qa-finpos"

# List all Argo CD applications and filter by the name pattern
apps=$(argocd app list --output name | grep "${app_name_pattern}")

if [ -z "$apps" ]; then
  echo "No applications containing '${app_name_pattern}' found."
else
  for app in $apps; do
    echo "Deleting application: $app"
    # Delete the application
    argocd app delete $app --yes
  done
  echo "All applications containing '${app_name_pattern}' have been deleted."
fi

