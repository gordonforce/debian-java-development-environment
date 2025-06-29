# Convert installation scripts to ansible playbooks

## Features

- Install the necessary packages and dependencies
- Configure system settings for development
- Set up development tools and environments

## Requirements

- Chromebook Plus device with ChromeOS installed
- Linux (Crostini) enabled
- Internet connection for package installation

## Usage

1. install ansible on your Chromebook Plus device using zsh commands
   ```bash
   sudo apt update
   sudo apt install ansible
   ```
2. Create the directory ~/code/chromebook-plus-development-environment
   ```bash
   mkdir -p ~/code/chromebook-plus-development-environment
   cd ~/code/chromebook-plus-development-environment
   ```
3. Use the ansible inventory features to create a playbook for each package managed by homebrew and apt and save the
   playbook file(s) in a directory named after the package beneath the project's root directory.
4. Do not include playbooks for transitive packages, only the top-level packages.
