################################################################################
# Shell and drush commands to update the given installation
#
# Go to sites/all/scripts (e.g. cd sites/all/scripts) and type "sh update.sh"
# in your console/shell/Terminal.
#
# The commands have to be functional for any case after the initial installation
# installation. So on any set up after calling that script, the configuration
# must be the same.
#
# For example:
# ------------
# When the script enabled a module in an earlier revision and that module shall
# not be enabled in the current revision, we have to add a "drush dis" and a
# "drush pm-uninstall" command for that module to this script.
#
################################################################################

# Normalize be relocating to the current scripts folder.
cd "$(dirname ${0})"

# Calling all scripts in the update folder and passing the first argument as tag.
# The script uses the shellwrapper to split up commands in mutliple files. That
# way we can better maintain them, and also are able to execute stage specific
# commands by using the "tag" argument.
bash ./shellwrapper/shellwrapper.sh ../update ${1}
