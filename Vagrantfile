# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

# Lesnar v0.0.1

# Get config file
lesnar = YAML.load_file('lesnar.yml')

# Require a tested Vagrant version
Vagrant.require_version ">= 1.8.1"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Set default provider for safety incase we forget to use a flag
  ENV['VAGRANT_DEFAULT_PROVIDER'] = lesnar["provider"]

  # VirtualBox OS - Ubuntu 14.04 x64
  config.vm.box = "ubuntu/trusty64"

  # Parallels OS - Ubuntu 14.04 x64
  config.vm.provider "parallels" do |v, override|
    override.vm.box = "parallels/ubuntu-14.04"
  end

  # Virtualbox specific settings
  config.vm.provider "virtualbox" do |v|
    v.name = lesnar["vmname"]
    v.memory = lesnar["ram"]
    v.cpus = lesnar["cpu"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Parallels specific settings.
  config.vm.provider "parallels" do |prl|
    prl.name = lesnar["vmname"]
    prl.memory = lesnar["ram"]
    prl.cpus = lesnar["cpu"]
    prl.update_guest_tools = true
  end

  # Enable VirtualBox guest additions to be updated
  config.vbguest.auto_update = true

  # Hostmanager config
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  # Network settings - Private network, not accessible via the internet
  config.vm.hostname = lesnar["hostname"]
  config.vm.network "private_network", ip: lesnar["ip"]
  # config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.hostmanager.aliases = lesnar["aliases"]

  # Folder sharing
  config.vm.synced_folder "www", "/server/www", owner: "www-data", group: "www-data"
  config.vm.synced_folder "database", "/server/database", owner: "www-data", group: "www-data"
  config.vm.synced_folder "log", "/server/log", :owner => "www-data", group: "www-data"

  # Disable the new default behavior introduced in Vagrant 1.7, to
  # ensure that all Vagrant machines will use the same SSH key pair.
  # See https://github.com/mitchellh/vagrant/issues/5005
  # config.ssh.insert_key = false

  # Ansible provisioner
  config.vm.provision "ansible" do |ansible|
    # ansible.verbose = "v"
    ansible.playbook = "provision/playbook.yml"
  end
end
