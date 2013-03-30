
# Ensure we got all symlinks on the local system we need to have.

# Go to the sites/default folder.
cd ../../../default

# Ensure the settings.php is correctly smylinked.
if [ ! -f settings.php ]
then
  ln -s settings.live.php settings.php
else
  echo "settings.php already present"
fi

# echo "<?php" > local.settings.php
if [ ! -d files ]
then
  mkdir files
else
  echo "files already exists"
fi
# Ensure files can be written.
chmod 777 files

# Navigating to root so we can set the .htacces symlink.
cd ../..
if [ ! -f .htaccess ]
then
  ln -s .htaccess.live .htaccess
else
  echo ".htaccess already exists"
fi
