
# Ensure we got all symlinks on the local system we need to have.

# Go to the sites/default folder.
cd $DRUPAL_SITE

# Ensure the settings.php is correctly smylinked.
if [ ! -f settings.php ]
then
  ln -s settings.live.php settings.php
else
  echo "settings.php already present"
fi

# Make sure the files directory was created and has appropriate rights.
if [ ! -d files ]
then
  mkdir files
else
  echo "files already exists"
fi
chmod 777 files

# Navigating to root so we can set the .htaccess symlink.
cd $DRUPAL_ROOT
if [ ! -f .htaccess ]
then
  ln -s .htaccess.live .htaccess
else
  echo ".htaccess already exists"
fi
