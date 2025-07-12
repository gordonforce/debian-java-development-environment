#!/usr/bin/bash


# If on macOS
# Step 1: Install a minimal homebrew environment to install git and ansible
# Get homebrew here
brew install --git ansible git # install unattended by answering with default values to questions
# or else
sudo apt-get install -y ansible git  # install unattended by answering with default values to questions

# Step 2: Clone the repository
# Check if we're already in the repository directory
DEV_ENV_LOCAL="$HOME"/.dev-env
DEV_ENV_LOCAL_PLAYBOOKS_REPO="$DEV_ENV_LOCAL"/dev-env
mkdir -p "$DEV_ENV_LOCAL"
cd "$DEV_ENV_LOCAL" || exit 1;
if [[ ! -e "dev-env" ]]; then
  git clone https://github.com/gordonforce/dev-env
else
  cd "$DEV_ENV_LOCAL_PLAYBOOKS_REPO" || exit 2;
  git pull
fi

cd "$HOME" || exit 3

ansible -f "$DEV_ENV_LOCAL_PLAYBOOKS_REPO"/src/main/ansible/zsh/playbook.yaml
ansible -f "$DEV_ENV_LOCAL_PLAYBOOKS_REPO"/src/main/ansible/oh-my-zsh/playbook.yaml
ansible -f "$DEV_ENV_LOCAL_PLAYBOOKS_REPO"/src/main/ansible/homebrew/playbook.yaml
ansible -f "$DEV_ENV_LOCAL_PLAYBOOKS_REPO"/src/main/ansible/secrets/playbook.yaml
