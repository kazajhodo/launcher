# execution
Add an alias to your terminal such as:

alias l="path-to-launcher-directory-parent/launcher/launcher.sh"

# Launcher description
Bash script that swaps system/terminal php versions using Homebrew php installs.

# Dependencies
Homebrew, script will check if you have it.

Feel free to use/modify. Developed for personal use.


# User Configuration File
User settings are now placed into your.launcher.settings.

This file is copied to .launcher.settings, which is not saved in the repo.

If these settings are ever expanded/updated, a warning message will display with instructions regarding maintaining your old settings, into the new settings system.

_Message will only show once. Once launcher is ran again current settings will be overritten and lost._


# Setup

## Set your variables
Edit variables within your.launcher.settings.

## PHP path setup.
Script attempts to automatically detect your php path include location.


# Paramaters

## PHP version
Ex. ```launcher 7.2```

## Project Opening
Ex. ```launcher [project-name]```

## Close items opened by launcher
Specified items that launcher opens are automatically closed before opening new items. Except for browser tabs, haven't got that working yet.

## Multiple parameter passing
Ex. ```launcher 7.2 [project-name]```

You may pass multiple parameters at once.

## Options
Ex. ```launcher [-help | --help]```

_Use '-help or --help' to view help details._


# Functionality walkthrough
# Below headings are files within /include/[filename].

### defaults
Default variable definitions.

### help
Shows help if parameter passed.

### terminus
Automates deployment through pantheon environments.

Retreive site php version: launcher.terminus.[site-name].php

### homebrew-check
Detects if Homebrew is installed, if not exits.

### migrate
Warns if settings options have changed within your.launcher.settings.

### overwrite
Actually overwrites/creates '.launcher.settings'file from 'your.launcher.settings' file.

### options-parameters
Options and parameters handling definitions.

### php-symlinks
Adds symlinks for various php versions.

### phpchange
Requests php version you would like to switch to, if not passed as an option.
Detects current php version, stops, unlinks.
Removes php reference.
Updates php reference.
Reloads php reference source.
Links requested php version, starts php.
Automatically outputs current system php version after changes with ‘ps aux | grep php’.
Automatically outputs terminal php version with ‘php -v’.

### kill
Closes open ide windows.
Closes open gittower windows.

### open-project
Opens project in ide editor and your.launcher.settings defined browser.

### framework-detection
Opens project url and login route if defined.

### tower
Opens project in tower.

### aliases
Search Pantheon aliases for a site. For instance searching by client code.

# Enhancements, Bugs, Invalid, Questions
Add at https://github.com/kazajhodo/launcher/issues
