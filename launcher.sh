#!/bin/bash

##
# Command Examples
##
# Switch php version.
# launcher [php-version]

# Check that homebrew is installed.
cd "${0%/*}" && source 'include/homebrew-check'

# Check if user configuration settings have been updated.
cd "${0%/*}" && source '.updated'

# Warn user to migrate settings file if updated, before overwrite.
cd "${0%/*}" && source 'include/migrate'

# Update user settings file.
cd "${0%/*}" && source 'include/overwrite'

# Setup php73 symlinks to work with launcher.
cd "${0%/*}" && source 'include/php73-symlinks'

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
