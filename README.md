# Launcher description
Bash script that swaps system and terminal php versions using Homebrew php installs.

# Dependencies
Homebrew.
Written on macOS Sierra, 10.12.6.

Feel free to use/modify. Developed for personal use.


# User Configuration File
User settings are now placed into your.launcher.settings.sh.

This file is copied to .launcher.settings.sh, which is not saved in the repo.

If these settings are ever expanded/updated, a warning message will display with instructions regarding maintaining your old settings, into the new settings system.

_Message will only show once. Once launcher is ran again current settings will be overritten and lost._


# Setup

## Dev controlled functionality
Starting at the '# Project loaders.' comment line there are additional functionality options.

Define your local projects location in the 'projects' variable.

## ide detection block
Uses 'which' to detect if ide is installed.
Check on command line by running ```which [ide-name]```.
```
if which subl >/dev/null 2>&1; then
  echo
  echo 'Which project are you working in? Exact directory name.'
  read project
  subl $projects$project
fi
```

## PHP path setup.
Script automatically detects your php path include location, if it is located within a hidden file under your user root.


# Paramaters

## PHP version
Ex. ```launcher 7.2```

*Script adds symlinking so that 7.3 works for local 'php' unnumbered 7.3 version.

## Project Opening
Ex. ```launcher [project-name]```

You may pass your project parent folder to be opened by your ide.

This assumes you have ide setup. Reference 'ide detection block' section.

## Close items opened by launcher
Ex. ```launcher kill```

Closes ide set within .launcher.settings.sh.
Closes tower application.
TODO:: Closes browser tabs with specified local domain suffix.

## Multiple parameter passing
Ex. ```launcher 7.2 project-name```

You may pass multiple parameters at once.

## Options
Ex. ```launcher -help```

May pass options to modify behavior.

_Use '--help' to view help details._


# Functionality walkthrough
Detects if Homebrew is installed, if not exits.

Adds symlinks for osx php version 7.3.
This allows using launcher to swap to 'php' named php version.

Requests php version you would like to switch to, if not passed as an option.

Detects current php version, stops, unlinks.
Removes php reference.
Updates php reference.
Reloads php reference source.
Links requested php version, starts.

Automatically outputs current system php version after changes with ‘ps aux | grep php’.
Automatically outputs terminal php version with ‘php -v’.

Opens provided directory in ide editor.   
Opens project url and admin route if defined.   
> _Depends on project directories being named the same as url base._   
Ex. 'site.local' is in the 'site' directory.


# Future functionality
+ Add github functionality to start a hotfix/feature/branch after project load.
+ Break functionality into seperate files.
+ Detect if sub-directory exists. If not, ask which directory contains site root.
+ Show help on update true.

# Enhancements, Bugs, Invalid, Questions
Add at https://github.com/kazajhodo/launcher/issues