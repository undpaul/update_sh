################################################################################
# We update the database before any full bootstrap update procedure is called.
################################################################################

# Update database.
drush $DRUSH_PARAMS --yes updb
