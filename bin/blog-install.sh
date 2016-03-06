#!/usr/bin/env bash

# Run the drupal image.
# After running, run bin/blog-install-after.sh to persist the settings.php file.
# Then stop this container and run szeremi-blog instead.
docker run --rm --name szeremi-blog-install \
    -e VIRTUAL_HOST=blog.szeremi.org \
    -v /mnt/szeremi-blog/uploads:/var/www/uploads \
    --link mysql \
    drupal:8.1
