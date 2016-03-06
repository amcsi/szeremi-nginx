#!/usr/bin/env bash

# Persist the installation for Drupal so that new instances of szeremi-blog would always use it.
docker cp szeremi-blog-install:/var/www/html/sites/default/settings.php /mnt/szeremi-blog/sites/default/settings.php
