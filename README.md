# Slim Bookshelf

This is a simple Slim 3 application that manages a list of books

It uses :
- Slim 3
- Illuminate as its database ORM
- Twig

## Composer

This project uses [Composer](https://getcomposer.org). Run `composer install` to install the dependencies.

## Run with php built-in web server

1. cd public && php -s localhost:8888 index.php
2. navigate to http://localhost:8888

## Vagrant

To use the Vagrant VM, install Vagrant, Virtual Box & the VirtualBox Extension
Pack. 

1. `vagrant up`
2. navigate to http://localhost:8888


## Cloud Foundry

You can deploy this app to Cloud Foundry with `cf push`. Look in `manifest.yml` and `.bp-config/options.json` for configuration.

## SQLite

To use SQLite as a database:

- create database

```
sqlite
.read data/seed-sqlite.sql
.save data/database.sqlite
```

- copy `app/settings.php.dist` to `app/settings.php`
- replace the database section

```php
'db' => [
    // Illuminate/database configuration
    'driver'    => 'sqlite',
    'database'  => 'data/database.sqlite',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
],
```

## Credits

The favicon is from the open source project [Twemoji](https://twemoji.twitter.com/). The graphics are copyright 2020 Twitter, Inc and other contributors. The graphics are licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/).
