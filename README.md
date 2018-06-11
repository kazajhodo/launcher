# Launcher description
Bash script that swaps system and terminal php versions using Homebrew.

# Dependencies
Homebrew.
Written on macOS Sierra, 10.12.6.

Feel free to use/modify. Developed for personal use.

# Functionality walkthrough
Detects if Homebrew is installed, if not exits.

Outputs a variety of hopefully amusing comments when initiated. Like, ‘Using the force’ and my favorite, 'rm -rf / #This is what you get for blindly trusting code.'.

Requests php version you would like to switch to with Homebrew.

Detects current php version, stops, unlinks.
Removes php reference in .zshrc.
Updates php reference in .zshrc.
Reloads .zshrc source.
Links requested php version, starts.

Automatically outputs current system php version after changes with ‘ps aux | grep php’.
Automatically outputs terminal php version with ‘php -v’.

Detects if sublime is installed. If so requests project to load.
Assumes projects directory is ‘Projects’, this can be updated in script with a simple variable change.

TODO:
If github detected, start github hotfix/feature branch.
If tower detected, open project in Tower.
