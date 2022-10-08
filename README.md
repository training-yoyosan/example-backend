![Quasar + Laravel = Love](https://baex.mpalade.ro/images/quasar_and_laravel_is_love.png)

# Example Backend (example-backend)

Laravel 9 skeleton API project to use with a Quasar/Nuxt.js or any other Vue related app.
It should also work with React related apps too.

The project uses:

- Laravel Sanctum's SPA authentication
- Laravel Fortify routes for login, registration, etc., without any views enabled.

## Demo

Check out SPA live demo at http://frex.mpalade.ro. Use `admin@example.local` and password `test1234` to login.

You can access the Laravel demo at http://baex.mpalade.ro.

## How to use

Just clone this project into your desired new awesome project folder:

```bash
cd ~/Work
git clone git@github.com:training-yoyosan/example-backend.git your-next-awesome-project 
```

and follow the instructions below to set it up for local or production.

Then customize it to your heart's content.

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

# to use sqlite, comment DB_DATABASE=laravel with a #
touch database/database.sqlite

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

As an alternative, I've added sail to make it simpler to run the project locally.

Just run:

```bash
./vendor/bin/sail up -d
```

and use `http://localhost` for your `quasar.config` proxy. 

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
cp .env.production.sample .env.production
##
# Adjust the following:
# - APP_URL
# - SANCTUM_STATEFUL_DOMAINS
# - SESSION_DOMAIN
# - Database related vars
##
vim .env.production
php artisan key:generate

# run migrations
php artisan migrate --seed
```

#### Notes

These are the values I use for my example instance so that it works with the SPA:

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
```

**Note**: You're going to use a subdomain for the backend.

That's it.

## Upgrade Notes

### Laravel Fortify

I've recently switched to using [Laravel Fortify](https://laravel.com/docs/9.x/fortify) since it's more appropriate for the purpose of the repository.
Run the following commands to install everything that's needed:

```bash
# for local environment
composer install
php artisan migrate

# for production environment
composer install --optimize-autoloader --no-dev
php artisan migrate
php artisan config:cache
php artisan route:cache
```

## Resources

-   https://laravel.com/docs/9.x/sanctum#spa-authentication
-   https://laravel.com/docs/9.x/fortify
-   https://laracasts.com/series/whats-new-in-laravel-7/episodes/6
-   Quasar Discord #laravel channel
-   https://blog.codecourse.com/laravel-sanctum-airlock-with-postman/
