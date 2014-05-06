# OSX specific cusomizations go here
# This file is version controlled; to make local changes, add them to either:
# - Your user specific file (~/.config/fish/<username>.fish)
# - Your host specific file (~/.config/fish/<hostname>.fish)

# Textmate defaults to /usr/bin/mate, but let's check for /usr/local/bin/mate
set -gx ZENHOME ~/dev/zenoss
set -gx PATH $ZENHOME/bin $PATH
