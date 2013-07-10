# Drupal update.sh by undpaul

This is a basic template of an update script we use nowadays for updating all
parts of the Drupal installation after a code update was made in the repository.
It is used on the local environment as well as on the integration, test and live
site to perform different tasks to ensure the drupal site is configured in the
way we want it to be.

In the past, whenever a developer, tester, pm or any other personen, wanted to
run the latest configuration on the own environemnt, there had to be done a
bunch of tasks to ensure the configuration is exactly set up the way it is meant
to be. After fetching the repository, for example one has to run the update.php,
revert some features, manually delete some old fields, run some batch operation,
update the search index, ... . Besides the fact to keep up with all those taks
to be done, there was allways the opportunity that tasks were missed, executed
in the wrong order or executed with wrong parameters. There was no way to proof
tasks were executed in the same way and order they were needed to update the
drupal application in the way it is needed to function correctly.

The solution is quite simple: eliminate the human element.

Therefore we started to deploy a update.sh in every project we work on. That
update.sh holds all commands that ensure drupal configuration is set up in the
way we need it.

## Command

The update script relies on bash. It may work with other shells, but is not yet
tested with those.

Simply call "sh update.sh TAGNAME" to call the shellwrapped scripts.

## Shellwrapper

The script uses https://github.com/undpaul/shellwrapper to organize a bunch of
scripts in the /update folder. The scripts within that folder are called in
alphanumeric order and may be restricted to a specific stage tag.

Scripts are either .sh or .exportsh files.

- .sh : They are executed as subshells. They cannot change any variables of the
  wrapper call but may access those variables in read only. Variables set within
  a subshell are only available in that scope and cannot be accessed in another
  subshell.
- .exportsh: They are sourced shells. So they can alter wrapper variables by
  using the "export" command. They can be used to set up some basic variables
  subshells may rely on.

## Scripts

The scripts located in `update` are split up in several files, as they all have
their purpose for fullfilling some task of deploying and setting up the drupal
site to the state we need it.

### Tasks

Tasks may be any deployment related stuff Drupal needs to ensure the site is
rolled out correctly and exactly behaves like intended.

The commands have to be functional for any time after the initial installation.
So the command may not break the drupal installation or perform tasks multiple
times that are only meant to be performed once.

Example:

When the script enabled a module in an earlier revision and that module shall
not be enabled in the current revision, we have to add a "drush dis" and a
"drush pm-uninstall" command for that module to this script.

More examples will be located in the update folder soon.

### Location

We use to locate the update script (update.sh, update and shellwrapper folder)
within the sites/all/scripts of our drupal installation, due to restrictions in
our current git deployment (drupal root is the root of the repository). A better
way is to locate it outside of the docroot. Thereofre you have to take in mind
that the drush command for that application is only available with ajdusting the
root directory (--root in drush command or cd to the drupal root).

The snippet in  [002_environment_auto.exportsh](https://github.com/undpaul/update_sh/blob/master/update/002_environment_auto.exportsh)
takes care of that location. An associated `$DRUSH_PARAMS` variabel is buitl in
[009_drush_params.exportsh](https://github.com/undpaul/update_sh/blob/master/update/009_drush_params.exportsh).

## Installation

If the shellwrapper folder is empty, you have to download it from
https://github.com/undpaul/shellwrapper and place it in /shellwrapper.

## Read more

In our [undpaul Blog](http://www.undpaul.de/en/blog) you can read more about our
procedures using drush and shell scripts.

* [Simplify your development workflow with Drush and scripts](http://www.undpaul.de/en/blog/2013/06/26/simplify-your-development-workflow-drush-and-scripts) [en]
* [Drupal-Konfiguration managen und ausrollen
](http://www.undpaul.de/blog/2013/06/27/drupal-konfiguration-managen-und-ausrollen) [de]

## Contact

Originally created by Johannes Haseitl - johannes@undpaul.de

undpaul GmbH - die Drupal-Spezialisten

http://www.undpaul.de
