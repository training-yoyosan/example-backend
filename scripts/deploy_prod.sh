#!/bin/bash

git pull
# step 1
php artisan down
composer install --optimize-autoloader --no-dev
# php artisan migrate
php artisan config:cache
php artisan route:cache
php artisan view:cache

# fix permissions
chown -R mpalade:mpalade .
chmod -R u+rwX,go+rX,go-w .

# all done
php artisan up
