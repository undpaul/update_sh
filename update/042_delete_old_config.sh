################################################################################
# We need to delete old configuration from the database, so we do to not clutter
# up the application with irrelevant configuration.
################################################################################

#drush $DRUSH_PARAMS --yes field-delete field_old --entity_type=taxonomy_term --bundle=oldterm
