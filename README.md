# Slim Bookshelf

This is a simple Slim 3 application that manages a list of books


## Vagrant

To use the Vagrant VM, install Vagrant, Virtual Box & the VirtualBox Extension
Pack. If you install the `vagrant-hostsupdater` Vagrant plugin, then your hosts
file will be automatically updated too.

1. `vagrant up`
2. navigate to http://slim-bookshelf.localhost


If you don't use the hostsupdater plugin, then the /etc/hosts record you need
is:

    192.168.98.12 slim-bookshelf.localhost phpmyadmin.slim-bookshelf.localhost mailcatcher.slim-bookshelf.localhost



