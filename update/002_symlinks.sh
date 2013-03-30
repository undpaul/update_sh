################################################################################
# Ensure we got all symlinks on the stage we currently are.
################################################################################

# We quit this script part if no stage indicator was set.
if [ "$STAGE_INDICATOR" == "" ]
then
  echo "No stage indicator given                                      [status]"
  exit
fi

# Go to the sites/default folder.
cd $DRUPAL_SITE

# Ensure the settings.php is available.
if [ ! -f settings.php ]
then
  ln -s "settings.$STAGE_INDICATOR.php" settings.php
else
  echo "settings.php already present"
fi

# Ensure the files directory exists and has proper rights.
if [ ! -d files ]
then
  mkdir files
else
  echo "files already exists"
fi
# Ensure files can be written.
chmod 777 files

# Navigating to root so we can set the .htaccess symlink.
cd $DRUPAL_ROOT
if [ ! -f .htaccess ]
then
  ln -s ".htaccess.$STAGE_INDICATOR" .htaccess
else
  echo ".htaccess already exists"
fi
