#!/bin/bash

git pull
composer install --optimize-autoloader --no-dev
php artisan migrate
php artisan config:cache
php artisan route:cache
php artisan view:cache

# fix permissions
chown -R mpalade:mpalade .
chmod -R u+rwX,go+rX,go-w .
