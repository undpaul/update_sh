################################################################################
# Script to show status of the drupal install before proceeding.
################################################################################

echo "uri: $DRUPAL_URI"
echo "root: $DRUPAL_ROOT"

# Clean drush cache to ensure all commands are available.
drush $DRUSH_PARAMS cc drush

# Check and show drupal status.
drush $DRUSH_PARAMS status
