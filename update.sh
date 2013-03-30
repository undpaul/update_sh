#!/bin/bash
################################################################################
# Wrapper script to call all scripts located in the /update folder.
#
# The wrapper uses the shellwrapper from https://github.com/undpaul/shellwrapper
# to execute multiple
#
# See README.md for more information.
#
################################################################################

# Ensure we call from the current script file directory.
cd "$(dirname ${0})"

# Calling all scripts in the update folder and passing the first argument as tag.
# The script uses the shellwrapper to split up commands in multiple files. That
# way we can better maintain them and also are able to execute stage specific
# commands by using the "tag" argument.
# The tag argument is passed from this
bash ./shellwrapper/shellwrapper.sh ../update ${1}
