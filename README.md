# A multi-platform Java development environment

# Features

## Programing Languages

* The latest Java LTS version or greater.
* The latest Z shell version as the default shell with command line completion and color terminal support.
* Terminal CLI development environment.
* Integrated Development Environments.
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

* No plain-text secrets in configuration files or version control.
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

  * Attended and unattended installations
  * Recreate this environment with only knowing
  * The URL for this repository
  * Your secrets' encryption key
  * Your VCS credentials
  * A suitable virtual or bare metal system operating system with 32 GB of disk storage

# Implementation

## Guidelines

* Use package managers and configuration orchestrators to automate the installation and maintenance
  of this environment.
* Use the hosts's default system package manager for tools tightly coupled with operating system
  such as configuration orchestration, encryption, version control, and secrets management.
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

* Preferred: Install a single version by default to simplify configuration as it can support the latest LTS version.
* Install the javadoc for the above version as well.
* Use jenv to manage Java versions other than the latest GA version.

#### Z Shell

* Installed as the default shell.
* Text Mode Command Line Applications
  * Include these applications on the PATH for interactive and non-interactive shell sessions.
  * Include shell aliases that reference only text-mode command-line applications in interactive and non-interactive shell sessions.
  * Include these shell aliases in all interactive sessions
    * lsd: ls -lathd
    * upgrade: sudo apt-get upgrade
  * Use Oh-My-Zsh for command line completion and color theme management in interactive sessions.
* Graphics Mode Applications
  * Include all applictions and aliases for interactive text-mode command line applications.
  * Include graphics-mode applications on the PATH for interactive shell sessions on a graphics-capable host. 
  * Include shell aliases that reference any graphics-mode applications in an interactive shell sessions.

* Put 


#### Integrated Development Environments

* Eclipse
* IntelliJ
* Visual Studio Code

#### Common Tools

##### Text Editors

* vim for cli terminals on all platforms
* gvim for GUI on Debian-based systems.
* macVim for GUI on macos. 

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

  * Use the open source password manager [pass](https://www.passwordstore.org/) to encrypt and store secrets
  * Store the encrypted passwords in the cloud using a private GitHub repository.
  * [Git integrates with pass for credential management](https://github.com/languitar/pass-git-helper). 
  * Use the `pass show` command to avoid storing plain text secrets in version control.

#### Encrypted External Communications

  * [Use SSH when interacting with GitHub using the Git CLI.](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
  * Manage GitHub repositories and workflows with [gh](https://cli.github.com/). GH encrypts all traffic exchanged with GitHub.

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

## Installation 

### Steps
Installation requires several steps. 

#### Install configuration orchestration

Download this script and execute it in your home directory to install Ansible for configuration 
orchtestration, and the ansible scripts to complete installation.

```bash
sudo apt-get install -y wget vim
wget ``
chmod a+x install-configuration-management.zsh
./install-configuration-management.zsh
```

### Configure the Command Shell

Configure zsh so packages installed by brew and apt-get update zsh configuration files.

`configure-shell.zsh`

### Configure package managers
`configure-package-managers.zsh`

### Secrets Management

#### First Time: Create Secrets

Have the following information ready

##### Identity and Location

| Field                    | Mandatory | Key in Pass                       | Value If Exists                                                                                                                                                   | Default Value          | Purpose                                                         |
|--------------------------|-----------|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------|-----------------------------------------------------------------|
| Email Address            | yes       | personal/email-address            | N/A                                                                                                                                                               | N/A                    | How others should contact you.                                  |
| GPG Encryption Key       | yes       | personal/gpg/public-key           | N/A                                                                                                                                                               | N/A                    | Your default GPG key                                            |
| Full Name                | yes       | personal/name/full                | `"$(pass show personal/name/first) $(pass show personal/name/last)"`                                                                                              | N/A                    | How others should address formally.                             |
| Given Name               | yes       | personal/name/given               | N/A                                                                                                                                                               | N/A                    | What others should  se as your formal first name.               |
| Last Name                | yes       | personal/name/last                | N/A                                                                                                                                                               |                        |                                                                 |
| Nickname                 | yes       | personal/name/nick                | N/A                                                                                                                                                               |                        |                                                                 |
| Username                 | yes       | personal/name/user                | `echo $LOGNAME`                                                                                                                                                   |                        |                                                                 |
| Language                 | yes       | personal/language/name            | N/A                                                                                                                                                               | English                | What language do you develop in?                                |
| Language Code Standard   | yes       | personal/language/standard        | N/A                                                                                                                                                               | ISO 639-1              |                                                                 |
| Language Code            | yes       | personal/language/code            | `echo $LANG \| sed 's/^([a-z]{2})_/$1/'`                                                                                                                          | en                     |                                                                 |
| Language File Encoding   | yes       | personal/language/file-encoding   | `echo $LANG \| sed 's/\.([A-Z][A-Z0-9\-]+)/$1/'`                                                                                                                  | UTF-8                  |                                                                 |
| Country                  | yes       | personal/country/name             | N/A                                                                                                                                                               | United States          | United States                                                   | 
| Country Code Standard    | yes       | personal/country/standard         | N/A                                                                                                                                                               | ISO 3166-1             |                                                                 |
| Country Code             | yes       | personal/country/code             | echo $LANG \| `sed 's/[a-z]{2}_([A-Z]{2})/$1/'`                                                                                                                   | US                     |                                                                 |
| Timezone                 | yes       | personal/timezone/name            | N/A                                                                                                                                                               | Pacific                |                                                                 |
| Timezone Code Standard   | yes       | personal/timezone/standard        | If `pass show personal/timezone/code` exists, set to IANA Timezone Database, other prompt user with the default value.                                            | IANA Timezone Database |                                                                 |
| Timezone Code            | yes       | personal/timezone/code            | `echo $TZ`                                                                                                                                                        | America/Los_Angeles    | When others should expect a response to their request.          |
| SSH Directory            | no        | personal/ssh/config-directory     | $HOME/.ssh if the directory exists                                                                                                                                | $HOME/.ssh             | The file system location of your SSH files                      |
| SSH Known Hosts          | no        | personal/ssh/known-hosts/content  | The contents of $HOME/.ssh/known_hosts                                                                                                                            | N/A                    |                                                                 |
| SSH Known Hosts Update   | no        | personal/ssh/known-hosts/update   | N/A                                                                                                                                                               | yes                    | Should dev-env keep your known SSH hosts list between instances |
| SSH Private Key Filename | no        | personal/ssh/private-key/filename | If `pass show personal/ssh/config-directory` directory exists and contains one file with an SSH private key, use the filename for this value, or prompt the user. | N/A                    |                                                                 |
| SSH Private Key Value    | no        | personal/ssh/private-key/content  | N/A                                                                                                                                                               | N/A                    | Your default SSH private key for encrypted remote sessions.     |
| SSH Public Key Filename  | no        | personal/ssh/public-key/filename  | If `pass show personal/ssh/config-directory` directory exists and contains one file with an SSH public key , use the filename for this value, or prompt the user. | N/A                    |                                                                 |
| SSH Public Key Value     | no        | personal/ssh/public-key/content   | If `pass show personal/ssh/public-key-file-path` exists, use the contents of this file if its key foramt is valid, or prompt the user for a value.                | N/A                    | Your default SSH public key for encrypted remote sessions.      | 

##### Git CLI Configuration
                                                                                                                                
| Field                        | Mandatory | Git Config Name    | Key in Pass                     | Value if Exists                                             | Default Value | Purpose                                                  |
|------------------------------|-----------|--------------------|---------------------------------|-------------------------------------------------------------|---------------|----------------------------------------------------------|
| Email Address                | yes       | user.email         | git/config/email-address        | `pass show personal/email-address`                          | N/A           | The email address to associate with your Git operations  |
| Full Name                    | yes       | user.name          | git/config/full-name            | `pass show personal/name/full`                              | N/A           | The name to associate with you Git operations            |
| GPG Commit Signing Key       | no        | user.signingkey    | git/config/commit-signing-key   | `pass show personal/gpg/public-key`                         | N/A           |                                                          |
| Sign GPG Commits             | yes       | commit.gpgsign     | git/config/sign-commits         | true if `pass list personal/gpg-key` exists otherwise false | N/A           |                                                          |
| Pull Request Rebase Strategy | yes       | pull.rebase        | git/config/pull-rebase-strategy | N/A                                                         | local         |                                                          |
| Push Strategy                | yes       | push.default       | git/config/push-strategy        | N/A                                                         | simple        |                                                          |
| Default Branch               | yes       | init.defaultbranch | git/config/default-branch       | N/A                                                         | main          |                                                          |
| Use Colorized UI Text        | yes       | color.ui           | git/config/color-ui             | N/A                                                         | auto          |                                                          |
| Editor                       | yes       | core.editor        | git/config/editor               | vim if vim is on the path, otherwise, prompt the user       | nano          |                                                          |
| Text File Line Endings       | yes       | core.autocrlf      | git/config/line-endings         | N/A                                                         | input         |                                                          |

##### GitHub Configuration

| Field                   | Mandatory | GitHub Name | Key in Pass                    | Value if Exists                                                                                        | Default Value | Purpose |
|-------------------------|-----------|-------------|--------------------------------|--------------------------------------------------------------------------------------------------------|---------------|---------|
| Username                | yes       | owner       | github/owner                   | `pass show personal/name/user`                                                                         | N/A           |         |
| API Token               | yes       | ?           | github/api-token               | `echo $GH_ENTERPRISE_TOKEN`                                                                            | N/A           |         |
| Public Owner GitHub URL | yes       | ?           | github/owner-url               | `https:/github.com/$(pass show github/owner)` if an HTTP GET request returns a 200 including redirects | N/A           |         |
| Commit Signing Key      | no        | ?           | github/commit-signing-key      | `pass show git/commit-signing-key`                                                                     | N/A           |         |
| SSH Public Key Filename | no        | ?           | github/ssh/public-key/filename | `pass show personal/ssh/public-key/filename`                                                           | N/A           |         |
| SSH Public Key Value    | no        | ?           | github/ssh/public-key/content  | `pass show personal/ssh/public-key/content`                                                            | N/A           |         |
| Git CLI Remote Username | yes       | ?           | git/remote/username            | `pass show github/owner`                                                                               | N/A           |         |
| Git CLI Remote Password | yes       | ?           | git/remote/password            | `pass show github/api-key`                                                                             |               |         |

### Install Development Tools 
`install-dev-tools.zsh`

##### Provision Configuration Management

Install ansible and git cli

###### Dependencies
Ansible
Git CLI

###### Configuration
Installation defaults

##### Provision Z Shell

Install and configure Z Shell

###### Dependencies
  * Phase: Provision Configuration Management
  * Zsh 
  * Oh-My-Zsh

###### Configuration
No additional configuration


#### Provision Configuration Management

##### Dependencies
 * Phase: Provision Z Shell
 * Homebrew

##### Configuration
 * Clone this project to $HOME/.local/dev-env/ using GitHub credentials for Git CLI

#### Dependencies



## Development Tools

## By Feature

* Build System: Maven using the mvnvm maven version virtualization utility with maven 3.9.10 as the
  default. Use the Maven wrapper in projects to set the maven version to one installed. 
* Integrated Development Environment: The latest GA version of IntelliJ Ultimate installed by the
  jetbrains-toolbox application.
* Development and Security Operations (DevSecOps) Tools
  * CI-CD: [GitHub Actions](https://github.com/features/actions)
  * Encryption: gnupg
  * Infrastructure as Code: ansible, apt-get, homebrew, and jetbrains-toolbox
  * Secrets Vault:
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
