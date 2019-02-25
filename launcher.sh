#!/bin/bash

# Check if homebrew is installed
# If not, stop the machinations
if which brew >/dev/null 2>&1; then
  installed=true
else
  echo "Brew is not installed on your system, this won't work"
  echo "Please try again later. But don't."
  exit 0
fi

comments=(
  "A long time ago, in a galaxy far, far away. #if{{exists(spotify)}} spotify -p star wars theme"
  "rm -rf / #This is what you get for blindly trusting code."
  "Using the force."
  "Don\'t forget to do your time log."
  "It WAS a wonderful day. Until it wasn't."
  "Ahhh SH*%"
  "Switching projects... AGAIN."
)


# Capture our fun comment and output to confuse users
commentscount=${#comments[@]}
target=$((RANDOM%7))

echo
echo ${comments[target]}
echo

echo 'Which php version are we switching to? Version number only, ex: 5.6, 7.0, 7.1. You can use anything that exists on your system.'
read phpchange
echo 'Doing stuff...'

# Capture current php version
phpversion=$(php -i aux | grep 'PHP Version')
set -- $phpversion

# PHPVERSION example output: php extension version => 7.1.18
# $5 = 7.1.18
# Shortens to first 3 ex: 7.1
phpversion="$4"
phpversion=${phpversion:0:3}

if [[ $phpversion == $phpchange ]]; then
  echo
  echo "HEY!"
  echo "Php current version and specified version are the same you lunk. We're done here."
  echo
  php -v
  exit
fi

# Update php version and reload source
# Capture current user to use in paths
file="$HOME/.zshrc"

# Remove any php@ references within .zshrc file
awk '!/php@/' $file > temp && mv temp $file

# Export new php version to path
echo "export PATH=\"/usr/local/opt/php@$phpchange/bin:/usr/local/opt/php@$phpchange/sbin:\$PATH\"" >> $file

# Reload source to ensure we have current php version
source '/etc/profile'

echo 'Updated your .zshrc, reloaded source.'
echo 'Swapping php versions.'

# Changing php version
brew services stop php@$phpversion    
brew unlink php@$phpversion && brew link php@$phpchange --force
brew services start php@$phpchange

# Reload source again to ensure we have switched php version
source '/etc/profile'

# Show running version of php
echo
echo 'Current system php version:'
ps aux | grep php
echo

#Show running console version of php
echo
echo 'Current terminal php version:'
php -v
echo

#
#
# TODO:
# Add github functionality
# Start a hotfix or feature
# Depending on response h/f
# Fire off corresponding hotfix or feature start
# 
#

#
#
# TODO:
# Check if tower is used
# If so, open hotfix in tower
# 
# 

# Project loaders

# Checks if [ide] is installed
# If it is, requests project you wish to open
# Assumes projects will be set by the dev using the script

# Projects location variable
# To be used in all below editor opening blocks, should be incorporate more
projects="$HOME/Projects/"

# Uncomment the editor you wish to use

#if which subl >/dev/null 2>&1; then
#  echo
#  echo 'Which project are you working in? Give me the foldername exactly.'
#  read project
#  subl $projects$project
#fi

if which code >/dev/null 2>&1; then
	echo
	echo 'Which project are you working in? Give me the foldername exactly.'
	read project
	code $projects$project 
fi
