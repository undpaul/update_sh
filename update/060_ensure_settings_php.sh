################################################################################
# We can ensure to load variables from settings.php by deleting the variable
# from the variable table.
################################################################################

# Disable update email notification.
drush $DRUSH_PARAMS --yes vdel update_notify_emails
