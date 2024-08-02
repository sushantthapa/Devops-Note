#!/bin/bash

# Navigate to your repository
cd /home/sushant/Documents/Obsidian\ Vault\ Devops\ Notes/Devops-Note/ || exit

# Add all changes
git add .

current_date=$(date +"%Y-%m-%d %H:%M:%S")

# Commit the changes with a message
git commit -m "Automated commit on $current_date"

# Push to the main branch
git push origin main

