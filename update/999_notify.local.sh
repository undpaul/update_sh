
# Check for available notification system
# Checks in preferred order and only uses one: Notification Center, Growl, Audio
# For OS X 10.8 use terminal notifier "sudo gem install terminal-notifier" http://rubygems.org/gems/terminal-notifier
# For Growl, download and install growlnotifier http://growl.info/downloads#generaldownloads
if [ $( find /Library/Ruby/Gems/ -name 'terminal-notifier*' -type d | wc -l) -ge 1 ]; then
    # Notification center output for finished update.sh
    terminal-notifier -message "$USER, the update script run is complete" -title "undpaul Update Script"
elif [ -f /usr/local/bin/growlnotify ]; then
    # Growl notification
    growlnotify -n "undpaul Update Script" -m "$USER, the update script run is complete"
elif [ $(command -v say) ]; then
    # Vocal output for finished update.sh
    say "$USER, the update script run is complete"
fi
