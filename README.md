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

Message will only show once. Once launcher is ran again current settings will be overritten and lost.


# Setup

## Dev controlled functionality
Starting at the '# Project loaders.' comment line there are additional functionality options.

Define your local projects location in the 'projects' variable.
Run a 'which [ide name]' to detect your ide installation path. Use this to add your own ide detection block.

There is an example block, starts with the comment '#Example ide detection block'.

## PHP path setup.
Local machines are different, your path may be in a differen location.

Goto your user root and search for opt/php to find your php export code.

Then find 'file="$HOME/.zshrc"' in the launcher.sh file.
Change .zshrc to where you found your php export= path.


# Paramaters

## PHP Version
Ex. 'launcher 7.2'

There is code that allows you to pass 7.3, which is php, as 7.3 as well.

## Project Opening
You may pass your project parent folder to be opened by your ide.
Ide of choice may be modified at the bottom of the file.

Ex. 'launcher [project-name]'


## Options
May pass '-y' to skip prompt if you would like to open a project.
Ex. 'launcher 7.2 -y'

May pass '--help' to view help details.


# Functionality walkthrough
Detects if Homebrew is installed, if not exits.

Adds symlinks for osx php version 7.3.
This allows using launcher to swap to osx php version.

Requests php version you would like to switch to, if not passed as an option.

Detects current php version, stops, unlinks.
Removes php reference.
Updates php reference.
Reloads php reference source.
Links requested php version, starts.

Automatically outputs current system php version after changes with ‘ps aux | grep php’.
Automatically outputs terminal php version with ‘php -v’.


# Future functionality

## Github branch creation
Add github functionality.
Start a hotfix/feature/branch after project load.
Detect php path location.
Break functionality into seperate files.


# Enhancements, Bugs, Invalid, Questions
Add at https://github.com/kazajhodo/launcher/issues