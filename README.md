# Launcher description
Bash script that swaps system and terminal php versions using Homebrew php installs.

# Dependencies
Homebrew.
Written on macOS Sierra, 10.12.6.

Feel free to use/modify. Developed for personal use.

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

Outputs a variety of hopefully amusing comments when initiated. Like, ‘Using the force’ and my favorite, 'rm -rf / #This is what you get for blindly trusting code.'.

Requests php version you would like to switch to, if not passed as an option.

Detects current php version, stops, unlinks.
Removes php reference in .zshrc.
Updates php reference in .zshrc.
Reloads .zshrc source.
Links requested php version, starts.

Automatically outputs current system php version after changes with ‘ps aux | grep php’.
Automatically outputs terminal php version with ‘php -v’.


# Future functionality

## Github branch creation
Add github functionality.
Start a hotfix/feature/branch after project load.
Detect php path location.


# Enhancements, Bugs, Invalid, Questions
Add at https://github.com/kazajhodo/launcher/issues