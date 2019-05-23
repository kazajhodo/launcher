# Launcher description
Bash script that swaps system and terminal php versions using Homebrew.

# Dependencies
Homebrew.
Written on macOS Sierra, 10.12.6.

Feel free to use/modify. Developed for personal use.

# Paramaters
May pass php version number to skip prompting.
Ex. 'launcher 7.2'

# Options
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

# Dev controlled functionality
Starting at the '# Project loaders.' comment line there are additional functionality options.

Define your local projects location in the 'projects' variable.
Run a 'which [ide name]' to detect your ide installation path. Use this to add your own ide detection block.

There is an example block, starts with the comment '#Example ide detection block'.

Detect if ide installed. If so requests project to load if '-y' not passed as an option.

# Future functionality
TODO:
Add github functionality.
Start a hotfix/feature/branch after project load.

TODO:
Check if tower is used.
If so, open repository in tower.
