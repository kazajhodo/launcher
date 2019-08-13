#!/bin/bash

##
# Command Examples
##
# Switch php version.
# launcher [php-version]

# Switch php version.
# Use '/localDev' as path instead of '/projects'.
# launcher [php-version] -p


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
    '-help' | '--help')
      help=$item
      ;;
    '-p')
      pantheon=1
      ;;
    *)
      # Do a '-' check to make sure this isn't an option.
      # If it has a check we should return to use -help.

      # Check for a number or number with decimal.
      check="^[0-9]+([.][0-9]+)?$"
      if [[ $item == *-* || $item =~ $check ]]; then
        echo
        echo "Yo, monkeypants, $item is not an option. Do a \"launcher -help\" to see whats powers you may bend towards your nefarious plotting."
        echo
        exit 0
      else
        project=$item
      fi
  esac
done

# Help display definition.
if [[ $help ]]; then
  echo
  echo 'Change your php versions alot? You are in the right place.'
  echo 'This should make it a little easier, hopefully.'
  echo
  echo 'Parameters [optional]:'
  echo '  7.0     switch to this php version'
  echo '       - if your version does not exist, it can be added on line 37.'
  echo '  [directory-name] project directory name to open'
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

# Capture current php version.
phpversion=$(php -i aux | grep 'PHP Version')
set -- $phpversion

# PHPVERSION example output: php extension version => 7.1.18.
# $5 = 7.1.18.
# Shortens to first 3 ex: 7.1.
phpversion="$4"
phpversion=${phpversion:0:3}

# If: php version passed and they are equal.
# Elif: only run if a change number was passed.
if [[ $phpversion == $phpchange ]]; then
  echo
  echo "HEY!"
  echo "Php current version and specified version are the same, you lunk."
  echo
  php -v
  echo

  # If a project is set.
  # We're still going to do stuff.
  if [[ $project ]]; then
    echo
    echo "I'll still open a project for a lunk though."
    echo "Opening $project."
    echo
  fi
elif [[ $phpchange ]]; then
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


# If php version was not passed as an option.
if [[ ! $phpchange || $phpversion == $phpchange && $project ]]; then
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
    if [[ ! $project ]]; then
      # Ask user if they want to open in editor.
      echo 'Open a project? y/n'
      read openproject
    else
      openproject="y"
    fi

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
    if [[ ! $project ]]; then
      if which code >/dev/null 2>&1; then
        echo
        echo 'Which project are you working in? Exact directory name.'
        read project
      fi
    else

      # Terminal commands need to fire first, or the program be selected and command issued.
      # When opening multiple programs, we're dealing with specific timing.
      # Which creates a variety of issues.

      cd $projects$project
      code $projects$project

      # TODO:
      # Get 

      # Currently this executes applescript properly.
      # However there is a timeout issue.
      # This line executes before application has finished loading its window.
      # Not sure how to get around this yet.
      # I think the best way is to timeout, then select the application(s), then apply the command(s).
      # osascript -e 'tell application "System Events" to key code 124 using {control down, option down}'
      
      # Example ide detection block.
      # Uses 'which' to detect if ide is installed.
      # if which subl >/dev/null 2>&1; then
      #   echo
      #   echo 'Which project are you working in? Exact directory name.'
      #   read project
      #   subl $projects$project
      # fi

      # Opera Developer options
      if open -Ra 'Opera Developer' >/dev/null 2>&1; then
        open -a 'Opera Developer' "http://$project.ash"
        open -a 'Opera Developer' "http://$project.ash/user"
      fi

      # Tower options
      if which gittower >/dev/null 2>&1; then
        gittower $projects$project
      fi
    fi
  fi
fi