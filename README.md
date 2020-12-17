![Quasar + Laravel = Love](https://baex.mpalade.ro/images/quasar_and_laravel_is_love.png)

# Example Backend (example-backend)

Laravel 8 project to use with a Quasar app.

## Demo

Check out SPA live demo at http://frex.mpalade.ro. Use `admin@example.local` and password `test1234` to login.

You can access the Laravel demo at http://baex.mpalade.ro.

## Local setup

### Install the dependencies

```bash
composer ins
npm install
```

### Setup `.env` file

```bash
cp .env.example .env
##
# adjust database settings to use sqlite or mysql
##
vim .env
##
# generate APP_KEY
##
php artisan key:generate
```

### Run migrations + seeding

```bash
php artisan migrate --seed
```

### Setup in webserver and `/etc/hosts`

-   Add a VirtualHost for `example.local` in your Apache or nginx configuration.
-   Add the mapping in `/etc/hosts` or `C:\Windows\System32\drivers\etc\hosts`(in Windows).

```
127.0.0.1   example.local
```

### Almost there

Next set up the Quasar app from [here](https://github.com/training-yoyosan/example-frontend).

Now access the application at http://localhost:8080.

Use `admin@example.local` and password `test1234` to login.

### Debugging in Postman

Since this project uses Sanctum's cookie authentication, you have to follow
[this guide](https://blog.codecourse.com/laravel-sanctum-airlock-with-postman/) to be able to debug your API requests with Postman.

## Deployment in production

### Setup

```bash
# install dependencies
composer ins
yarn

# setup env
cp .env.production .env
##
# Adjust the following:
# - APP_URL
# - SANCTUM_STATEFUL_DOMAINS
# - SESSION_DOMAIN
# - Database related vars
##
vim .env
php artisan key:generate

# run migrations
php artisan migrate --seed
```

#### Note

These are the values I use for my subdomain so that it works with the SPA:

```
SANCTUM_STATEFUL_DOMAINS=frex.mpalade.ro
SESSION_DOMAIN=.mpalade.ro
```

- `frex.mpalade.ro` is the subdomain of my SPA
- I'm using ```.mpalade.ro``` for the session domain so that cookies are correctly set for all subdomains.
- You can narrow the scope of the session domain if you have many nested domains, that is:
    - You have the subdomain ```abc.xyz.spa.example.com```
    - You can set the session domain to ```.spa.example.com```

### Cache essentials

```bash
composer install --optimize-autoloader --no-dev
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

**Note**: You're going to use a subdomain for the backend.

That's it.

## Resources

-   https://laravel.com/docs/7.x/sanctum#spa-authentication
-   https://laracasts.com/series/whats-new-in-laravel-7/episodes/6
-   Quasar Discord #laravel channel
-   https://blog.codecourse.com/laravel-sanctum-airlock-with-postman/
