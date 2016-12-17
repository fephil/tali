# -*- mode: ruby -*-
# vi: set ft=ruby :

# tali v0.0.7

# Get config file
require 'yaml'
tali = YAML.load_file('provision/tali.yml')

# Are we on Unix/OSX or Windows?
def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    }
  end
  return nil
end

# Minimum Vagrant version
Vagrant.require_version ">= 1.8.1"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Set default provider for safety incase we forget to use a flag
  ENV['VAGRANT_DEFAULT_PROVIDER'] = tali["vm"]["provider"]

  # VirtualBox OS - Ubuntu 14.04 x64
  config.vm.box = "ubuntu/trusty64"

  # Parallels OS - Ubuntu 14.04 x64
  config.vm.provider "parallels" do |v, override|
    override.vm.box = "parallels/ubuntu-14.04"
  end

  # Virtualbox specific settings
  config.vm.provider "virtualbox" do |v|
    v.name = tali["vm"]["name"]
    v.memory = tali["vm"]["ram"]
    v.cpus = tali["vm"]["cpu"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Parallels specific settings.
  config.vm.provider "parallels" do |prl|
    prl.name = tali["vm"]["name"]
    prl.memory = tali["vm"]["ram"]
    prl.cpus = tali["vm"]["cpu"]
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
  config.vm.hostname = tali["vm"]["hostname"]
  config.vm.network "private_network", ip: tali["vm"]["ip"]
  # config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.hostmanager.aliases = tali["vm"]["aliases"]

  # Folder sharing
  # Disable the default vagrant behaviour of sharing the entire project
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder "www", "/server/www", owner: "www-data", group: "www-data"
  config.vm.synced_folder "database", "/server/database", owner: "www-data", group: "www-data"
  config.vm.synced_folder "log", "/server/log", :owner => "www-data", group: "www-data"

  # Disable the new default behavior introduced in Vagrant 1.7, to
  # ensure that all Vagrant machines will use the same SSH key pair.
  # See https://github.com/mitchellh/vagrant/issues/5005
  # config.ssh.insert_key = false

  # If Ansible is installed, run the playbook
  # Or run the Windows script which installs Ansible from inside the guest VM
  if which('ansible-playbook')
    config.vm.provision "ansible" do |ansible|
      # ansible.verbose = "v"
      ansible.playbook = "provision/playbook.yml"
    end
  else
    config.vm.synced_folder "provision", "/server/provision"
    config.vm.provision :shell, path: "provision/windows.sh", args: ["default"]
  end
end
