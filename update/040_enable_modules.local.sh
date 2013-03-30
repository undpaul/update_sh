################################################################################
# Enable some development modules.
################################################################################

# For local development and testing we enable some modules.
#drush --yes $DRUSH_PARAMS pm-enable rules_admin
#drush --yes $DRUSH_PARAMS pm-enable stage_file_proxy
#drush --yes $DRUSH_PARAMS pm-enable features_yaml

# We enable views dev settings.
#drush $DRUSH_PARAMS vd

# views_flag_refresh was the only one to provide display extenders, we make sure
# the value is cleared, as long it is not defined by a feature.
#drush $DRUSH_PARAMS --yes vdel views_display_extenders
