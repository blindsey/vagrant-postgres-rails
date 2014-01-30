vagrant-dev-env
===============

A vagrant + chef-solo setup for 12.04 LTS (precise64) using postgresql, ruby 1.9.3, rails 3.2.x, imagemagick, and redis.

Installation
------------

1. Download and install VirtualBox [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
2. Download and install Vagrant [http://downloads.vagrantup.com/](http://downloads.vagrantup.com/)
3. Add the VM

```
$ vagrant box add precise64 http://files.vagrantup.com/precise64.box
$ cd vagrant-postgres-rails
$ vagrant up
$ vagrant ssh
```
Note: this assumes your rails code is located in ~/Project/rails-art250-staging
