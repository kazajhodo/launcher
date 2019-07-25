#!/bin/bash


# TODO:
# Allow passing of project name.


# Check if homebrew is installed.
# If not, stop the machinations.
if which brew >/dev/null 2>&1; then
  installed=true
else
  echo "Brew is not installed on your system, this won't work"
  echo 'Install homebrew or gtfo. Smiley face.'
  exit 0
fi

# Mac default php version is 7.3
# Homebrew does not contain symlinks for this version.
# Lets add them.

# Check if php symlinks are installed for 7.3.
# This is done to allow switching to php 7.3 using the 'php@7.3'.
php73='/usr/local/Cellar/php73'
phpat73='/usr/local/Cellar/php@7.3'
# Checks if symlink exists regardless of if what it points to exists (-L).
# Check if symlink exists and what it points to exists, regardless of type (-e).
# If both do not exist, we create them.
if ! [[ -L $php73 && -e $phpat73 ]]; then
  cd /usr/local/Cellar && ln -s php@7.3 php73 && ln -s /usr/local/bin/php php@7.3 
fi

# Check and set parameters and options.
for item in $*
do
  case $item in
    '5.6' | '7.0' | '7.1' | '7.2' | '7.3')
      phpchange=$item
      ;;
    '-y')
      yes=$item
      ;;
    '--help')
      help=$item
      ;;
    '-p')
      pantheon=1
      ;;
    *)
      echo $item ' is not an acceptable parameter or option.'
      echo 'Using the --help option to view available options.'
      launcher --help
      exit 0
  esac
done

# Help display definition.
if [[ $help ]]; then
  echo
  echo 'Change your php versions alot? You are in the right place.'
  echo 'This should make it a little easier, hopefully.'
  echo
  echo 'Parameters:'
  echo '  7.0     switch to this php version'
  echo
  echo 'Options:'
  echo '  -y          auto answer yes to prompts'
  echo '  -p          This is a pantheon site'
  echo
  echo 'Help:'
  echo '  --help      View this list. Ironic.'
  echo
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
  "Monkeys Monkeys MONKEYS. Get me out."
)

# If php version was not passed as an option.
if [[ ! $phpchange ]]; then
  # Capture our fun comment and output to confuse users.
  commentscount=${#comments[@]}
  target=$((RANDOM%7))

  echo
  echo ${comments[target]}
  echo

  echo 'Which php version are we switching to? Version number only, ex: 5.6, 7.0, 7.1. You can use anything that exists on your system.'
  read phpchange
  echo 'Doing stuff...'
fi

# Capture current php version.
phpversion=$(php -i aux | grep 'PHP Version')
set -- $phpversion

# PHPVERSION example output: php extension version => 7.1.18.
# $5 = 7.1.18.
# Shortens to first 3 ex: 7.1.
phpversion="$4"
phpversion=${phpversion:0:3}

if [[ $phpversion == $phpchange ]]; then
  echo
  echo "HEY!"
  echo "Php current version and specified version are the same you lunk."
  echo "Perhaps you'd like to open a project still..."
  echo
  php -v
  echo
else
  # Update php version and reload source.
  # Capture current user to use in paths.
  file="$HOME/.zshrc"

  # Remove any php@ references within .zshrc file.
  awk '!/php@/' $file > temp && mv temp $file

  # Export new php version to path
  echo "export PATH=\"/usr/local/opt/php@$phpchange/bin:/usr/local/opt/php@$phpchange/sbin:\$PATH\"" >> $file

  # Reload source to ensure we have current php version.
  source '/etc/profile'

  echo 'Updated your .zshrc, reloaded source.'
  echo 'Swapping php versions.'

  # Changing php version.
  brew services stop php@$phpversion    
  brew unlink php@$phpversion && brew link php@$phpchange --force
  brew services start php@$phpchange

  # Reload source again to ensure we have switched php version.
  source '/etc/profile'

  # Show running version of php.
  echo
  echo 'Current system php version:'
  ps aux | grep php
  echo

  #Show running console version of php.
  echo
  echo 'Current terminal php version:'
  php -v
  echo
fi


# Project loaders.

# Checks if [ide] is installed.
# If it is, requests project you wish to open.
# Assumes projects path and ide commenting will be set by the dev using the script.

# Projects location variable.
# To be used in all below editor opening blocks.
if [[ pantheon == 1 ]]; then
  projects="$HOME/Localdev/"
else
  projects="$HOME/Projects/"
fi

# If -y option is passed.
# Skip question and set openup to true.
if [[ $yes ]]; then
  openup=true
else
  # Ask user if they want to open in editor.
  echo 'Open a project? y/n'
  read openproject

  # If -y passed or user signaled to open project.
  if [[ $openproject ==  'yes' || $openproject == 'y' ]]; then
    openup=true
  else
    echo
    echo 'Until next time scrubanub.'
    echo
  fi
fi

# ide options
# Uncomment the editor you wish to use.

if [[ $openup ]]; then
  if which code >/dev/null 2>&1; then
    echo
    echo 'Which project are you working in? Exact directory name.'
    read project
    code $projects$project 
  fi

  # Example ide detection block.
  # Uses 'which' to detect if ide is installed.
  # if which subl >/dev/null 2>&1; then
  #   echo
  #   echo 'Which project are you working in? Exact directory name.'
  #   read project
  #   subl $projects$project
  # fi

  # tower options
  if which gittower >/dev/null 2>&1; then
    gittower $projects$project
  fi
fi