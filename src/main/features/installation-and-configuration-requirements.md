# Installation and Configuration Requirements

# Phases 

## Provision configuration orchestration
  * Command: `src/main/install-configuration-management.zsh`
  * Results: Ansible and Git CLI applications are available to use on the command line.
  * Verification: Installation verification passes for both

## Provision ZSH
  * Command: `ansible-playbook -f src/main/ansible/provision-zsh.yaml`
  * Results 
    * Installation tests pass
    * As queried from the default shell 
      * An alias named `lsd` that equals `ls -latdh`.
      * An alias named `upgrade` that equals `sudo apt-get upgrade; brew upgrade`.

## Provision package managers

## Provision secrets management

## Configure Java Development Tools

# Installation

## Git CLI

### Installation

| OS                       | Config Manager | Package Manager | Package Name | Version |
|--------------------------|----------------|-----------------|--------------|---------|
| Crostini, Debian, Ubuntu | None           | apt-get         | git          | latest  |
| MacOS                    | None           | homebrew        | git          | latest  |

### Configuration
 * Package manager defaults.

### Verification
* The `git --version` command must return version 2.39.0 or higher.

## Ansible

### Installation

| OS                       | Config Manager | Package Manager | Package Name | Version |
|--------------------------|----------------|-----------------|--------------|---------|
| Crostini, Debian, Ubuntu | None           | apt-get         | ansible      | latest  |
| MacOS                    | None           | homebrew        | ansible      | latest  |

* Configuration: Package manager defaults.
* Verification: The `ansible-playbook --version` command must return version 'core 2.14.0' or higher.

## Zsh: Z shell

### Dependencies
* Ansible

### Installation

| OS                       | Config Manager | Package Manager | Package Name | Version |
|--------------------------|----------------|-----------------|--------------|---------|
| Crostini, Debian, Ubuntu | ansible        | apt-get         | zsh          | latest  |
| MacOS                    | ansible        | N/A             | N/A          | N/A     |

### Configuration
1. Make zsh the default shell with default answers to questions.
2. Add these shell aliases to an interactive zsh session.

| OS                       | Name    | Commands                                |
|--------------------------|---------|-----------------------------------------|
| All                      | lsd     | `ls -latdh`                             |
| Crostini, Debian, Ubuntu | upgrade | `sudo apt-get upgrade -y; brew upgrade` |
| MacOS                    | upgrade | `brew upgrade`                          |

## Oh, My Zsh

### Dependencies
* Ansible
* Zsh

### Installation

| OS  | Config Manager | Package Manager | Package Name | Version |
|-----|----------------|-----------------|--------------|---------|
| All | ansible        | N/A             | N/A          | N/A     |

### Configuration
1. Use the oh-my-zsh default theme

## Applications At the Latest Version With Default Configuration Only

| OS                       | Config Manager | Package Manager | Package Name | Version |
|--------------------------|----------------|-----------------|--------------|---------|
| Crostini, Debian, Ubuntu | ansible        | apt-get         | gcc          | latest  |
| Crostini, Debian, Ubuntu | ansible        | apt-get         | glibc        | latest  |
| Crostini, Debian, Ubuntu | ansible        | apt-get         | curl         | latest  |
| Crostini, Debian, Ubuntu | ansible        | apt-get         | vim          | latest  |
| macOS                    | ansible        | brew            | gcc          | latest  |
| macOS                    | ansible        | brew            | glibc        | latest  |
| macOS                    | ansible        | brew            | curl         | latest  |
| macOS                    | ansible        | brew            | vim          | latest  |

## Homebrew

### Dependencies
* Ansible
* Git
* Gcc
* Glibc
* Curl
* Vim

