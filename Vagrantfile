# -*- mode: ruby -*-
# vi: set ft=ruby :

# Lesnar v0.0.1

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Set default provider, for safety incase we forget to use a flag
  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'
  # ENV['VAGRANT_DEFAULT_PROVIDER'] = 'parallels'

  # VirtualBox OS - Ubuntu 14.04 x64
  config.vm.box = "ubuntu/trusty64"

  # Parallels OS - Ubuntu 14.04 x64
  config.vm.provider "parallels" do |v, override|
    override.vm.box = "parallels/ubuntu-14.04"
  end

  # Virtualbox specific settings
  config.vm.provider "virtualbox" do |v|
    v.name = "lesnar" # Change this to project name
    v.memory = 1024
    v.cpus = 1
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Parallels specific settings.
  config.vm.provider "parallels" do |prl|
    prl.name = "lesnar"  # Change this to project name
    prl.memory = 1024
    prl.cpus = 1
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
  config.vm.hostname = "lesnar.dev"
  config.vm.network "private_network", ip: "192.168.50.101"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.hostmanager.aliases = %w(www.lesnar.dev lesnar.dev)

  # Ansible provisioner
  # config.vm.provision "ansible" do |ansible|
  #  ansible.playbook = "provision/playbook.yml"
  # end

end
