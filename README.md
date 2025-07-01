# A multi-platform Java development environment

# Features

## Programing Languages

* The latest Java LTS version or greater.
* The latest Z shell version.
* Integrated Development Environments.
* A Z shell terminal with command line completion and color terminal support.
* Stream editing tools for popular configuration and data exchange formats.
* A text editor

## Development and Security Operations (DevSecOps)

### Version Control

* command line interface
* IDE integration

### Cloud Hosted Repositories

* Authenticate access
* Signed commits
* Encrypted access

### Security

* No plain text secrets in configuration files or version control.
* All secrets are encrypted at rest.
* Cloud storage for encrypted secrets.

### Automation

#### Continuous Integration and Deployment (CI-CD)

* Build with all code quality checks
* Cloud based

#### Code Quality

* Code coverage
* Code inspections
* Branch coverage
* Cyclical complexity analysis
* Vulnerable dependency checks
* Code formatting
  * Java
  * JSON
  * YAML
  * XML

#### Maintenance Lifecycle

*
* Attended and unattended installations
* Recreate this environment with only knowing
* The URL for this repository
* Your secrets' encryption key
* Your VCS credentials
* A suitable virtual or bare metal system operating system

# Implementation

## Guidelines

* Use package managers, and configuration orchestrators to automate the installation and maintenance
  of this environment.
* Use the hosts's default system package manager for tools tightly coupled with operating system
  such as configuration orchestration, encryption, version control and secrets management.
* Use a third party package manager for development tools such as JDKs, stream editors, for
  consistency between platforms.
* Use IDE configuration automation tools to configure plugins and other IDE settings.
* Implementing a feature may require components from more than one package manager.
* The build system may provide code quality and other automation artifacts.
* Always use the latest GA version of a utility by default.

## Solution

### Operating Systems

#### Supported

* Crostini or Debian 12 Bookworm
  * Development Status: Active
  * Environment: Bare metal or virtual. Crostini is always virtual.
  * Desktop: XWayland over X11
* MacOS
  * Development Status: Pending
  * Environment: Bare metal, however, virtual support would be nice for testing.
  * Desktop: Native.
* Ubuntu 22.04 LTS (Jammy Jellyfish)
  * Development Status: Pending
  * The same as Debian 12 except as noted below
  * Desktop: Ubuntu default

#### User Configuration

 * Locale set from secret value user/locale
 * Timezone set form secret value user/timezone

### Programing Languages

#### Java

* Preferred: Install a single version by default as it can support the latest LTS version.
* Install the javadoc for the above version as well.
* Use jenv to manage specific versions of Java other than the latest GA version.

#### Z Shell

* Installed as the default shell.
* Oh-my-zsh for command line completion and color theme management
* These zsh aliases
  * lsd: ls -lathd
  * upgrade: sudo apt-get upgrade; brew upgrade

#### Integrated Development Environments

* Eclipse
* IntelliJ
* Visual Studio Code

#### Common Tools

##### Text Editors

* vim for text based terminals
* gvim for GUIs

##### Stream editing tools

* jq for JSON
* yq for YAML
* xq for XML

#### Network Clients

* wget
* curl

## Development and Security Operations (DevSecOps)

### Version Control

* Command Line Interface: Git CLI
* Secrets Integration: Git CLI Secrets integration with pass
* All three IDEs integrate with git

### Cloud Hosted Repositories

* GitHub as it supports:
  * Authenticate access
  * Digitally signed commits
  * Encrypted communications
  * Command line interface for automation.

### Security

#### Secrets Management

  * Use the open source password manager pass to encrypted secrets
  * Store the encrypted passwords in the cloud using a private GitHub repository.
  * Git integrates with pass for credential management. 
  * Use the `pass show` command when setting environment variables to avoid keep secrets as plain
  text.

#### Encrypted External Communications

  * Use SSH when interacting with GitHub using the Git CLI
  * Use gh to manage GitHub repositories and workflows. GH encrypts all traffic exchanged with GitHub.

#### Automation

##### CI-CD

  * [GitHub Actions hosted on GitHub](https://github.com/features/actions)
  * Supports maven and gradle build tools
  * Use the maven wrapper when setting the maven version for a project.
  * Use the mvnvm utility to set the default maven version for new maven wrapper configurations.
  * Use the gradle wrapper when setting the gradle version for a project.

##### Code Quality

##### Code Coverage

  * GHA: Jacoco from Maven build and SonarQube Cloud
  * IntelliJ: Internal Code Coverage Tool, SonarQube for IDEs plugin
  * Maven: Jacoco, and SonarQube for IDEs plugins

##### Branch Coverage

  * GHA: Jacoco from Maven build
  * Maven: Jacoco Plugin
  * Intellij: Not provided

#### Code Inspections

  * GHA: SonarQube cloud server
  * Maven: SonarQube for IDEs plugin
  * IntelliJ: IDE provided checks marked as Qodana 

* Automation
  * ...
  * Code Quality
    * ...
    * Cyclical complexity analysis
    * Vulnerable dependency checks
    * Code formatting
      * Java
      * JSON
      * YAML
      * XML
  * Configure and maintain this development environment
    * Attended and unattended installations
    * Recreate this environment with only knowing
    * The URL for this repository
    * Your GPG key
    * Your VCS credentials
    * A suitable virtual or bare metal system operating system

## Development Tools

## By Feature

* Build System: maven using the mvnvm maven version virtualization utility with maven 3.9.10 as the
  default
* Integrated Development Environment: The latest GA version of IntelliJ Ultimate installed by the
  jetbrains-toolbox application.
* Development and Security Operations (DevSecOps) Tools
  * CI-CD: [GitHub Actions](https://github.com/features/actions)
  * Encryption: gnupg
  * Infrastructure as Code: ansible, apt-get, homebrew, and jetbrains-toolbox
  * Secrets Vault: [pass](https://www.passwordstore.org/)
  * Source Code
    Integrity: [signed commits using gpg](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
  * Source Control: [Git](https://git-scm.com/)
  * Source Code Quality: SonarQube IDE Plugin for IntelliJ Ultimate using defaults; hence it is not
    installed by this project, but its node dependency is.
  * Source Code Test Coverage: Jacoco manged as a maven dependency; hence, it is not installed by
    this project
  * Source Repositories: [GitHub](https://github.com)
  * Virtualization: Docker containers for testing


# Installation

## Quick Start

1. Download and execute the first installation script

``` bash
wget .....
```

2. Follow the instructions as displayed by the scripts to provide values, execute a script, and
   restart your terminal session. You will several prompts for each.

## Phases

Phases exist as installing a tool can require a change to the shell environment, and later tool
installations may need a recently installed tool and updated shell environment. A fresh terminal
environment is the most reliable way to ensure a dependent tool and configuration are available
after boot.

# Implementation Requirements

## Configuration Management and Package Management

1. Use ansible to install and configure tools and have ansible use a package manager to manage the
   tool installation lifecycle where possible.
2. Use a bootstrap bash script that installs git and ansible using apt-get.
3. Use apt-get for tools with only one version installed where tight operating system integration is
   desired, and the installation of ansible.
4. Use homebrew for tools where more than one version is installed or tight operating system
   integration is not required.
5. Use jetbrains-toolbox to manage instances of JetBrains IDEs. There is no automation available for
   this package manager.

## Phases

### Bootstrap

Configuration Manager: none

Depends On: none

Package Manager: apt-get

Steps

1. Using apt-get in an unattended manner, update and upgrade existing packages, and install ansible,
   git, and zsh with default yes answers to all prompts
2. Clone the repository https://github.com/gordonforce/debian-java-development-environment from
   the $HOME directory using git
3. Create a directory named $HOME/bin and copy all scripts from the $
   HOME/debian-java-development-environment/src/main/zsh directory to $HOME/bin

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

- A debian base environment such as a Chromebook Plus device with the Linux development environment
  enabled
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

- `git/playbook.yml`: Ensures git is installed, it will install if it already exists, and always
  resets the configuration
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

You can customize the playbooks to suit your needs by editing the YAML files. Each playbook is
self-contained and can be modified independently.

## Troubleshooting

If you encounter any issues:

1. Check the Ansible output for error messages
2. Verify that all prerequisites are met
3. Try running the individual playbook that's causing the issue
4. Check the system logs for more information

## License

The MIT License as described in this project's LICENSE file.

mvn wrapper:wrapper -Dmaven=3.9.10
