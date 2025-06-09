# Debian Development Environment Components

## Components
### Applications
| name       | installation phase | why                                                                                                               |
|------------|--------------------|-------------------------------------------------------------------------------------------------------------------|
| ansible    | 1                  | manages installation of utilities with custom configurations                                                      |
| git        | 1                  | version control                                                                                                   |
| jq         | 1                  | a JSON cli editor                                                                                                 |
| vim        | 1                  | a full version of vim                                                                                             |
| x*         | 1                  | x-windows version 11 for tools with GUIs such as IDEs                                                             |
| xq         | 1                  | an xml cli editor                                                                                                 |
| yq         | 1                  | a yaml cli editor                                                                                                 |
| zsh        | 1                  | the z shell                                                                                                       |
| homebrew   | 2                  | a package manager for cross platform tools                                                                        |
| gnupg      | 3                  | gnu pgp encryption for signing git commits and securing secrets                                                   |
| jenv       | 3                  | a simple java virtual machine manager to orchestrate mulitple installed Java versions.                            |
| pass       | 3                  | a secrets management system for storing secrets for api keys, user identity, etc, using gpg encryption and GitHub |
| gh         | 5                  | a github cli for manging repositories and ci-cd workflows                                                         |
| openjdk@17 | 5                  | The latest OpenJDK Java 17 version, as Java 17 is an active Java LTS version                                      |
| openjdk@21 | 5                  | The latest OpenJDK Java 21 version, as Java 21 is an active Java LTS version                                      | 
| mvnvm      | 5                  | A virtual maven manager for cli                                                                                   |


### Git and GitHub CLI Configuration

1. Check if the git utility exists on the zsh command line. If it does not, exit the installation with a corresponding error message.
2. Configure the following git properties from these pass secrets. 
3. All properties listed in the table below must be configured.
4. If a secret does not exist in pass, and the git property is not default eligible, then exit the installation with a corresponding error message.
5. If a secret does not exist in pass, and the git property is default eligible, then use the default value for the git configuration property.

| Git Configuration Property | Pass Secret Name   | Default Eligible | Default Value |
|----------------------------|--------------------|------------------|---------------|
| user.name                  | GIT_USER_NAME      | no               | N.A.          |
| user.email                 | GIT_USER_EMAIL     | no               | N.A.          |
| core.editor                | GIT_CORE_EDITOR    | yes              | vim           |
| pull.rebase                | GIT_PULL_REBASE    | yes              | local         |
| push.default               | GIT_PUSH_DEFAULT   | yes              | simple        |
| init.defaultBranch         | GIT_DEFAULT_BRANCH | yes              | main          |
| color.ui                   | GIT_COLOR_UI       | yes              | auto          |

6. Add the exportable GH_ENTERPRISE_TOKEN environment variable to the .zprofile file with its value set to "$(pass GITHUB_ENTERPRISE_TOKEN)"

### The language and encoding for this environment to United States English using the UTF-8 encoding
Add the bash snippet below to the end of the ~/.zshenv file if it is not already defined. 
```bash
export LANG=en_US.UTF-8
```

### Set the command line editor to vi
add the bash snippet below to the end of the ~/.zshrc file if it is not already defined.
```bash
set -o vi
```

### A default optioned ls command named lsd
Add the bash snippet below to the end of the ~/.zshrc file if it is not already defined.
```bash
alias lsd="ls -latsdh"
```
### Upgrade both APT and Homebrew managed packages
Add the bash snippet below to the end of the ~/.zshrc file if it si not already defined.
```bash
alias upgrade="sudo apt-get -y update; sudo apt-get -y upgrade; brew upgrade"
```


