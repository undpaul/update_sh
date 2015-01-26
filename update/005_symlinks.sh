################################################################################
# Ensure we got all symlinks on the stage we currently are.
################################################################################

readonly TIMESTAMP=$(date +%s);

# We quit this script part if no stage indicator was set.
if [ "$STAGE_INDICATOR" == "" ]
then
  echo "No stage indicator given                                      [status]"
  exit
fi

# Go to the sites/default folder.
cd $DRUPAL_SITE

# Make sure the settings.php is allways set to the correct symlink.
# In case we already got a symlink, we delete it and reset it again.
if [ -L settings.php ]
then
  rm settings.php;
  echo "Resetting symlink for settings.php ..."
# In case it is no symlink, we back it up
elif [ -f settings.php ]
then
  mv settings.php "settings.$TIMESTAMP.bak.php";
  echo "settings.php is not a symlink. Backing it up now ...";
else
  echo "Setting symlink for settings.php";
fi
# Finally the symlink will be set.
ln -s "settings.$STAGE_INDICATOR.php" settings.php

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

# Make sure the .htaccess is allways set to the correct symlink.
# In case we already got a symlink, we delete it and reset it again.
if [ -L .htaccess ]
then
  rm .htaccess;
  echo "Resetting symlink for .htaccess ..."
# In case it is no symlink, we back it up
elif [ -f .htaccess ]
then
  mv .htaccess ".htaccess.$TIMESTAMP.bak";
  echo ".htaccess is not a symlink. Backing it up now ...";
else
  echo "Setting symlink for .htaccess";
fi
# Finally the symlink will be set.
ln -s ".htaccess.$STAGE_INDICATOR" .htaccess
