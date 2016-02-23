# lesnar v0.0.x

**A Vagrant server setup for developing LEMP websites.**

* Author: [Phil Lennon](http://frontendphil.com)
* Source: [github.com/fephil/lesnar](http://github.com/fephil/lesnar)
* Issues and Suggestions: [github.com/fephil/lesnar/issues](http://github.com/fephil/lesnar/issues)
* Download: [https://github.com/fephil/lesnar/releases](https://github.com/fephil/lesnar/releases)
* Twitter: [@frontendphil](http://twitter.com/frontendphil)
* Email: [enquiry@frontendphil.com](mailto:enquiry@frontendphil.com)

***

## About

TBA

Lesnar is an easy to use LEMP development server, using the latest stable versions of the best open source technologies available.

Lesnar contains the following key features:

* Built for Vagrant to quickly spin up a Virtual Machine, without affecting the host computer,
* Fully supports VirtualBox 5 and Parallels 11 (Pro/Business),
* Easy to configure by using the 'lesnar.yml' file,
* Uses Ansible 2 for installing required packages automatically,
* Built on the latest Ubuntu LTS version (14.04),
* Uses Nginx 1.8.

**Note:** Lesnar is designed to only run as a development server, it does not have the security required for production use.

## First Time Install

TBA

**Note:** Lesnar works on Linux or OSX. Windows is not supported at this time, but will be in the future.

* Install VirtualBox 5 Or Parallels 11 (Pro/Business),
* Install Vagrant 1.8.1,
* Install Ansible 2.0,
* Run in Terminal: `vagrant plugin install vagrant-hostmanager`,
* Run in Terminal: `vagrant plugin install vagrant-triggers`,
* If using VirtualBox, run in Terminal: `vagrant plugin install vagrant-vbguest`,
* If using Parallels, run in Terminal: `vagrant plugin install vagrant-parallels`.

## Project Usage

TBA

**Note:** An internet connection is required for downloading the various files required.

* Download the [latest release](https://github.com/fephil/lesnar/releases) and extract to a directory,
* Adjust the variables in `provision/lesnar.yml` to suit your preferences,
* In project folder, run in Terminal: `vagrant up`.

## Known Issues

* Windows isn't supported at this time. [#10](https://github.com/fephil/lesnar/issues/10)

## Credit
* [StackOverflow](https://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby) - For checking what host operating system is running
