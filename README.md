# dev-env - a Java development environment hosted on Crostini, Debian, MacOS, or Ubuntu

Provision and maintain a Java development environment using the latest version of Java with command line 
development tools, encrypted secrets such as passwords, keys and API keys, plus signed commits, JetBrains Toolbox, and 
Visual Studio Code. 

# Tooling

## Versions
* Install all tools using a package manager such as apt-get and homebrew, or an orchestration tool such as ansible.
* Use the default (latest) version of a tool available from a package manager.
* For tools where more than one major or minor versions are installed, such as Java or Maven, assume the latest patch version is installed.

## By Feature
* Operating Systems: 
  * Crostini or Debian 12 Bookworm
    * Environment: Bare metal or virtual. Crostini is always virtual.
    * Desktop: XWayland over X11
  * MacOS
    * Environment: Bare metal. Virtual support would be nice for testing.
    * Desktop: Native
  * Ubuntu 22.04 LTS (Jammy Jellyfish)
    * The same as Debian 12 except as noted below
      * Desktop: Ubuntu default
* User Configuration
  * Locale ISO-XXXX code
  * Timezone ISO-XXXX code
  * Operating system username
  * Operating system password 
  * encryption ids
* Shell
  * Z Shell with Oh-My-Zsh default theme as the default shell
* Programming Languages: 
  * Java - latest openjdk version 
  * Zsh

* Build System: maven using the mvnvm maven version virtualization utility with maven 3.9.10 as the default
* Integrated Development Environment: The latest GA version of IntelliJ Ultimate installed by the jetbrains-toolbox application. 
* Development and Security Operations (DevSecOps) Tools
    * CI-CD: [GitHub Actions](https://github.com/features/actions)
    * Encryption: gnupg
    * Infrastructure as Code: ansible, apt-get, homebrew, and jetbrains-toolbox
    * Secrets Vault: [pass](https://www.passwordstore.org/)
    * Source Code Integrity: [signed commits using gpg](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
    * Source Control: [Git](https://git-scm.com/)
    * Source Code Quality: SonarQube IDE Plugin for IntelliJ Ultimate using defaults; hence it is not installed by this project, but its node dependency is.
    * Source Code Test Coverage: Jacoco manged as a maven dependency; hence, it is not installed by this project
    * Source Repositories: [GitHub](https://github.com)
    * Virtualization: Docker containers for testing
* Automation
    * Formatted stream editors
      * jq for JSON
      * yq for YAML
      * xq for XML
    * Standalone Text editors
      * vim for cli
      * gvim for X11
    * GitHub
      * Git cli
      * GitHub cli using gh
    * Configuration Management
      * ansible - configures applications managed by homebrew or apt-get 
    * Package Managers
      * homebrew - manages virtualized applications and system agnostic tools.
      * jetbrains-toolbox - manages JetBrains IDE instances and versions.
    * Tooling Support
      * Node.js version 22 or higher. Required by the SonarQube IDE IntelliJ plugin.

# Installation

## Quick Start
1. Download and execute the first installation script
``` bash
wget .....
```
2. Follow the instructions as displayed by the scripts to provide values, execute a script, and restart your terminal session. You will several prompts for each.

## Phases

Phases exist as installing a tool can require a change to the shell environment, and later tool installations may need a recently installed tool and updated shell environment. A fresh terminal environment is the most reliable way to ensure a dependent tool and configuration are available after boot.

# Implementation Requirements

## Configuration Management and Package Management
1. Use ansible to install and configure tools and have ansible use a package manager to manage the tool installation lifecycle where possible.
2. Use a bootstrap bash script that installs git and ansible using apt-get. 
3. Use apt-get for tools with only one version installed where tight operating system integration is desired, and the installation of ansible.
4. Use homebrew for tools where more than one version is installed or tight operating system integration is not required.
5. Use jetbrains-toolbox to manage instances of JetBrains IDEs. There is no automation available for this package manager.


## Phases

### Bootstrap

Configuration Manager: none

Depends On: none

Package Manager: apt-get

Steps
1. Using apt-get in an unattended manner, update and upgrade existing packages, and install ansible, git, and zsh with default yes answers to all prompts 
2. Clone the repository https://github.com/gordonforce/debian-java-development-environment from the $HOME directory using git
3. Create a directory named $HOME/bin and copy all scripts from the $HOME/debian-java-development-environment/src/main/zsh directory to $HOME/bin

Provides: .zshrc, ansible, git

### Oh-My-Zsh

Configuration Manager: Ansible

Depends On: .zshrc

Package Manager: none

Steps
1. Download from URL and run the default configuration

Provides: oh-my-zsh

### Homebrew

Configuration Manager: Ansible

Depends On: .zshrc and oh-my-zsh

Steps
1. Download from URL and run the default configuration

Provides: brew

#### Independent Utilities

Depends On: .zshrc, brew, ansible, apt-get

#### Install
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
   sudo apt-get install -y ansible git 
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

mvn wrapper:wrapper -Dmaven=3.9.10
