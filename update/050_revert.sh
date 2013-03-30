################################################################################
# Revert features.
################################################################################

# Revert all features and clear cache as some features components are cache
# based.
drush $DRUSH_PARAMS --yes features-revert-all
drush $DRUSH_PARAMS cache-clear all

# Display list of features to check status manually.
drush $DRUSH_PARAMS features

