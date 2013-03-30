
# Remove no longer used modules
drush $DRUSH_PARAMS --yes pm-disable views_flag_refresh
drush $DRUSH_PARAMS --yes pm-disable flag_limit
drush $DRUSH_PARAMS --yes pm-uninstall views_flag_refresh
drush $DRUSH_PARAMS --yes pm-uninstall flag_limit

# Disable backup migrate.
drush $DRUSH_PARAMS --yes pm-disable backup_migrate
drush $DRUSH_PARAMS --yes pm-uninstall backup_migrate

