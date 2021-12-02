#!/usr/bin/env bash
drush cr
drush cim -y
drush updb -y
drush sapi-c
drush sapi-i
drush cr