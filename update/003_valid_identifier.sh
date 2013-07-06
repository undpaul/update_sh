################################################################################
#
# With this script we check, if there is an environment file for the entered
# stage indicator. This way we make sure we did not run the command with a
# mistyped indicator and so accidently break stuff.
#
################################################################################


# Stop script run, when no valid stage is given.
if [ "$STAGE_VALID" == "" ]
then
  echo "No valid stage has been set! See 001_environment.* for details.         [error]"
  exit 1
fi
