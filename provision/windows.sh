#!/usr/bin/env bash

# NOTE: All install prompts are automatic

# Install software properties to add ansible ppa
# TODO: Is this needed?
sudo apt-get install software-properties-common -y

# Add Ansible ppa
sudo add-apt-repository ppa:ansible/ansible -y

# Update Repositories
sudo apt-get update

# Install Ansible
sudo apt-get install ansible -y

# TODO: Add running of playbook
