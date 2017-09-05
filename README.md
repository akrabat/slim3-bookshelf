# Slim Bookshelf

This is a simple Slim 3 application that manages a list of books

## Composer

This project uses [Composer](https://getcomposer.org). Run `composer install` to install the dependencies.

## Vagrant

To use the Vagrant VM, install Vagrant, Virtual Box & the VirtualBox Extension
Pack. 

1. `vagrant up`
2. navigate to http://localhost:8888


## Cloud Foundry

You can deploy this app to Cloud Foundry with `cf push`. Look in `manifest.yml` and `.bp-config/options.json` for configuration.
