################################################################################
# Enable our modules and features.
################################################################################

# We use the master modul for controlling the module status.
# @see http://drupal.org/project/master
drush $DRUSH_PARAMS --yes pm-enable master

# And finally execute master.
drush $DRUSH_PARAMS --yes master-ensure-modules --scope=$STAGE_INDICATOR

