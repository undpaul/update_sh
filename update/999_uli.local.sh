# On the local machine, provide a one-time-login link.
# Open the website in your browser.
ULI=$( drush $DRUSH_PARAMS uli --browser=0 )

echo "Login as admin using:"

echo $ULI

read -p "Open in browser? [y] " -t 20
if [[ $REPLY =~ ^[Yy]$ ]]
then
  open $ULI
fi
