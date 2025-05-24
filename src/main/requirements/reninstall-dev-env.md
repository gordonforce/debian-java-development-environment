# Reinstall Development Environment

# Requirements

Create a zsh script named 'uninstall-dev-env.sh':
1. uninstall all homebrew packages and remove from homebrew from this system
2. uninstall oh-my-zsh and remove from this system

Create a zsh script named 'install-dev-env.sh':
1. update all apt packages and agree to all prompts
2. install apt packages for gpg git signing, git, git-gui, git-credential-libsecret, libsecert, rsync and x-windows if they are not already installed:
   - xorg
   - xserver-xorg
   - xinit
   - xterm
   - x11-xserver-utils
   - x11-utils
   - x11-session-utils
3. install oh-my-zsh with the default theme
4. install homebrew with default settings
5. install the following homebrew packages:
   - vim
   - jenv
   - openjdk@17
   - openjdk@21
   - mvnvm
   - gradle
   - rsync
   - yq
   - jq
   - gh
5. Make sure the following global git configuration values are set:
   - user.name = Gordon Force
   - user.email = gordonff@gmail.com
   - core.editor = vim
   - credential.helper = libsecret
   - pull.rebase = local
   - push.default = simple
   - init.defaultBranch = main
   - color.ui = auto
6. add the jdks to jenv
6. set the jenv global version to 21
7. set the maven version to 3.9.6 in mvnvm
8. recommend secret management tools that allow the removal of the literal github api token from my .zshrc script, until I approve one.
9. install the secret management tool I agreed to the the previous step
10. update the .zshrc file in this project to set the github api token to the secret management tool

All generated scripts must use zsh scripting best practices and be well documented.
A zsh script linting tool must be used to ensure the scripts are well formatted and follow best practices.

