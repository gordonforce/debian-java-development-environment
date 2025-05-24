# Chromebook Plus Development Environment

This repository contains Ansible playbooks for setting up a complete development environment on a Chromebook Plus device with ChromeOS and Linux (Crostini) enabled.

## Features

- Install necessary packages and dependencies
- Configure system settings for development
- Set up development tools and environments

## Requirements

- Chromebook Plus device with ChromeOS installed
- Linux (Crostini) enabled
- Internet connection for package installation
- Ansible installed

## Installation

1. Install Ansible on your Chromebook Plus device:
   ```bash
   sudo apt update
   sudo apt install ansible
   ```

2. Clone this repository:
   ```bash
   git clone <repository-url>
   cd chromebook-plus-development-environment
   ```

3. Run the main playbook:
   ```bash
   ansible-playbook main.yml
   ```

## Available Playbooks

The main playbook includes the following individual playbooks, which can also be run separately:

- `git/playbook.yml`: Installs and configures Git
- `gnupg/playbook.yml`: Installs and configures GnuPG for key management
- `oh-my-zsh/playbook.yml`: Installs and configures Oh My Zsh
- `homebrew/playbook.yml`: Installs and configures Homebrew
- `node/playbook.yml`: Installs Node.js
- `python/playbook.yml`: Installs Python
- `ruby/playbook.yml`: Installs Ruby
- `rust/playbook.yml`: Installs Rust
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

This project is licensed under the MIT License - see the LICENSE file for details.
