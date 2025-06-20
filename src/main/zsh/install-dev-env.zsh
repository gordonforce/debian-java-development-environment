#!/usr/bin/env zsh

# Debian Java Development Environment Installation Script
# This script implements the installation steps from the README.md file

# Step 1: Update package lists and install Ansible, Git, and zsh
sudo apt-get update
sudo apt-get install -y ansible git zsh

# Step 2: Clone the repository
# Check if we're already in the repository directory
if [[ ! -d "debian-java-development-environment" && ! -f "src/main/ansible/main.yml" ]]; then
  git clone https://github.com/gordonforce/debian-java-development-environment
  cd debian-java-development-environment
fi

# Step 3: Run the main playbook
# Determine the correct path to the main.yml file
if [[ -f "main.yml" ]]; then
  ansible-playbook main.yml
elif [[ -f "src/main/ansible/main.yml" ]]; then
  cd src/main/ansible
  ansible-playbook main.yml
  cd - > /dev/null
elif [[ -f "${HOME}/debian-java-development-environment/src/main/ansible/main.yml" ]]; then
  cd ${HOME}/debian-java-development-environment/src/main/ansible
  ansible-playbook main.yml
  cd - > /dev/null
else
  echo "Error: Could not find main.yml playbook"
  exit 1
fi
