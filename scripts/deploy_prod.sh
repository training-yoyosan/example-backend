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
sudo chown -R worker:www-data .
sudo chmod -R 775 .

# all done
php artisan up
