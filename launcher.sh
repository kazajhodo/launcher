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

# Check that homebrew is installed.
cd "${0%/*}" && source 'include/homebrew-check'

# Check if user configuration settings have been updated.
cd "${0%/*}" && source '.updated'

# Warn user to migrate settings file if updated, before overwrite.
cd "${0%/*}" && source 'include/migrate'

# Update user settings file.
cd "${0%/*}" && source 'include/overwrite'

# Setup php73 symlinks to work with launcher.
cd "${0%/*}" && source 'include/php-symlinks'

# Include variable defaults.
cd "${0%/*}" && source 'include/defaults'

# Options and parameters detection.
cd "${0%/*}" && source 'include/options-parameters'

# Help.
cd "${0%/*}" && source 'include/help'

# Run terminus deployment.
cd "${0%/*}" && source 'include/terminus'

# Php change.
cd "${0%/*}" && source 'include/phpchange'

# Kill.
cd "${0%/*}" && source 'include/kill'

# Open.
cd "${0%/*}" && source 'include/open-project'

# Local.
# Kill.
cd "${0%/*}" && source 'include/local'
