# Chromebook Plus Development Environment

This repository contains Ansible playbooks for setting up a complete development environment on a Chromebook Plus device with ChromeOS and Linux (Crostini) enabled.

## Features
A Java development environment using:
* the latest LTS Java version
* maven build system
* Git version control
* GitHub source code repositories 
* GitHub Actions CI/CD
* GitHub CLI
* zsh with oh-my-zsh
* pass "secrets management" system with gnupg encrypted secrets stored in a private GitHub repository
* homebrew package manager manages programming tools
  * Jenv configured with all the most recent OpenJDK LTS versions starting from 17
  * Maven Virtual Manager
  * 
* apt-get manages system tools and resources
* x11 for IDEs and other tools
* Jetbrains Toolbox
* node

## Installation Phases
- Install the necessary packages and dependencies
- Configure system settings for development
- Set up development tools and environments

## Requirements
- A debian base environment such as a Chromebook Plus device with the Linux development environment enabled
- Internet connection for package installation
- Ansible installed

## Installation
1. Install Ansible on your Chromebook Plus device:
   ```bash
   sudo apt-get update
   sudo apt-get upgrade
   sudo apt-get install -y ansible git git-gui jq node yq xq zsh
   ```
2. Clone this repository:
   ```bash
   git clone https://github.com/gordonforce/debian-java-development-environment
   cd debian-java-development-environment
   ```
3. Run the main playbook:
   ```bash
   ansible-playbook main.yml
   ```

## Available Playbooks

The main playbook includes the following individual playbooks, which can also be run separately:

- `git/playbook.yml`: Ensures git is installed, it will install if it already exists, and always resets the configuration
- `gnupg/playbook.yml`: Installs and configures GnuPG for key management
- `oh-my-zsh/playbook.yml`: Installs and configures Oh My Zsh
- `homebrew/playbook.yml`: Installs and configures Homebrew
- `node/playbook.yml`: Installs Node.js
- `openjdk/playbook.yml`: Installs OpenJDK and configures jenv
- `maven/playbook.yml`: Installs and configures Maven with mvnvm
- `gh/playbook.yml`: Installs and configures GitHub CLI
- `pass/playbook.yml`: Installs and configures pass for secret management
- `x11/playbook.yml`: Installs X11 packages

To run an individual playbook:
```bash
ansible-playbook <playbook-path>
```

For example:
```bash
ansible-playbook git/playbook.yml
```
## Post-Installation

After running the playbooks, you should:
1. Restart your shell or run `source ~/.zshrc` to apply all changes
2. Authenticate GitHub CLI by running `gh auth login` if you haven't already
3. Verify that all tools are working correctly

## Customization
You can customize the playbooks to suit your needs by editing the YAML files. Each playbook is self-contained and can be modified independently.

## Troubleshooting
If you encounter any issues:
1. Check the Ansible output for error messages
2. Verify that all prerequisites are met
3. Try running the individual playbook that's causing the issue
4. Check the system logs for more information

## License
The MIT License as described in this project's LICENSE file.
