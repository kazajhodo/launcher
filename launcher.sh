#!/bin/zsh

##
# Command Examples
##
# Switch php version.
# launcher [php-version]

# Open a project.
# launcher [project-directory]

# Change php and open a project.
# Order of commands do not matter.
# launcher [project-directory] ['php-verion']

# Deploy a site with terminus on pantheon.
# Will deploy, updb, cim, cr per environment.
# launcher terminus.[site-name].[site-env]

# Build a site locally from Pantheon.
# launcher local.[site-name]

# The launcher's own directory, resolved once (:A follows symlinks). Every
# include is sourced by absolute path from here rather than by cd'ing into it,
# so the working directory stays wherever the launcher was run from — the
# terminus deploy reads the project's git remote from it.
launcher_dir=${0:A:h}

# Include function utilities.
source "$launcher_dir/include/utilities"

# Check that homebrew is installed.
source "$launcher_dir/include/homebrew-check"

# Check if user configuration settings have been updated.
source "$launcher_dir/.updated"

# Warn user to migrate settings file if updated, before overwrite.
source "$launcher_dir/include/notification"

# Warn user to migrate settings file if updated, before overwrite.
source "$launcher_dir/include/migrate"

# Update user settings file.
source "$launcher_dir/include/overwrite"

# Setup php symlinks to work with launcher.
source "$launcher_dir/include/php-symlinks"

# Include variable defaults.
source "$launcher_dir/include/defaults"

# Options and parameters detection.
source "$launcher_dir/include/options-parameters"

# Help.
source "$launcher_dir/include/help"

# Php change.
source "$launcher_dir/include/phpchange"

# Kill.
source "$launcher_dir/include/kill"

# Run terminus deployment.
source "$launcher_dir/include/terminus"

# Aliases search.
source "$launcher_dir/include/aliases"
