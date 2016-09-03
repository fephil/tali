# tali v0.0.4

**A Vagrant server setup for developing LEMP websites.**

* Author: [Phil Lennon](http://frontendphil.com)
* Source: [github.com/fephil/tali](http://github.com/fephil/tali)
* Issues and Suggestions: [github.com/fephil/tali/issues](http://github.com/fephil/tali/issues)
* Download: [https://github.com/fephil/tali/releases](https://github.com/fephil/tali/releases)
* Twitter: [@frontendphil](http://twitter.com/frontendphil)
* Email: [enquiry@frontendphil.com](mailto:enquiry@frontendphil.com)

***

## About

Tali is an easy to use LEMP development server which uses the latest modern open source technologies available. Tali contains the following key features:

* Uses Vagrant & Ansible to automatically build a Virtual Machine, without affecting the host computer,
* Fully supports VirtualBox 5 and Parallels 11 (Pro/Business),
* Easy to configure by using the 'tali.yml' file,
* Built on the latest official Ubuntu LTS version images (14.04),
* Includes nginx 1.8,
* Includes PHP 7,
* Includes MariaDB 10.1.

**Note:** Tali is designed to only run as a development server on your machine, it does not have the security required for production use.

## First Time Install

* Install VirtualBox 5 Or Parallels 11 (Pro/Business),
* Install Vagrant 1.8.1. [Download Link](https://www.vagrantup.com/downloads.html),
* Install Ansible 2.0. [Install instructions](http://docs.ansible.com/ansible/intro_installation.html#installing-the-control-machine),
* Run in Terminal: `vagrant plugin install vagrant-hostmanager vagrant-triggers`,
* If using VirtualBox, run in Terminal: `vagrant plugin install vagrant-vbguest`,
* If using Parallels, run in Terminal: `vagrant plugin install vagrant-parallels`.

On OSX, using Parallels 11 is recommended due to its increased speed. However, VirtualBox is free and works well.

**Note:** Tali supports OSX or Linux. Windows is not supported at this time, but hopefully will be in the future.

## Usage

Once the first time install has been completed, it is an easy process to set up a website.

### Project Setup

**Note:** An internet connection is required for downloading the various files required.

* Download the [latest release](https://github.com/fephil/tali/releases) and extract to a directory,
* Adjust the variables in `provision/tali.yml` to suit your preferences,
* Put your website files into the `www` folder,
* In project folder, run in Terminal: `vagrant up`,
* Wait for the server to build, you may need to enter your host system password.

### Accessing the Virtual Machine using SSH

Vagrant manages the SSH authentication process so all you need to do is run `vagrant ssh` in the project folder to access the Virtual Machine.

### Using MariaDB

MariaDB is a drop in open source replacement for MySQL, all mySQL commands work identically and for day to day operation, there is no difference in using MariaDB.

You can either directly log into MariaDB by using SSH or by using software like 'Sequel Pro'.

#### To login using SSH:

* `vagrant ssh`,
* `mysql -u [username] -p`. Default username is 'tali',
* Enter your password from tali.yml when prompted. Default password is 'tali'.

#### To login using external software:

These instructions are based on Sequel Pro for OSX. When creating a new connection:

* Select SSH,
* MySQL host: `127.0.0.1`,
* Username: `[username]`. Default username is 'tali',
* Password: `[password]`. Default password is 'tali',
* Port: `leave blank`, (3306),
* SSH Host: `[hostname]`, Default hostname is 'tali' or 'tali.dev',
* SSH User: `vagrant`,
* SSH Password: `vagrant`.

### Adding PHP extensions

If extra PHP modules are required e.g. GD, you can add them to the tali.yml file, under the PHP extensions variable. Make sure you add the PHP 7 version of each extension e.g `php7.0-gd`. You can then install the extensions by running `vagrant provision` in the project folder.

If you log into the Virtual Machine, you can run the following command to find available PHP 7 extensions:

`sudo apt-cache search php7-*`

## Known Issues

* Windows isn't supported at this time. [#10](https://github.com/fephil/tali/issues/10)

## Credit

* [StackOverflow](https://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby) - For checking what host operating system is running,
* [Phansible](http://phansible.com) - For server language and timezone example.
