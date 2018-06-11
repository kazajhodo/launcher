# launcher
Bash script that swaps system and terminal php versions using homebrew.

# Functionality walkthrough
Detects if homebrew is installed, if not exits.

Outputs a variety of hopefully amusing comments when initiated. Like, ‘Using the force’.

Requests php version you would like to switch to with homebrew.

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

FUTURE:
Add different ide loaders. Currently only sublime included, adding additional should be easy using sublime model.
