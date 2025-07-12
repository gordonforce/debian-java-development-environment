c#!/usr/bin/env zsh


# If on macOS
# Step 1: Install a minimal homebrew environment to install git and ansible
# Get homebrew here
brew install ansible git # install unattended by answering with default values to questions
# or else
sudo apt-get install -y ansible git  # install unattended by answering with default values to questions

# Step 2: Clone the repository
# Check if we're already in the repository directory
mkdir -p $HOME/.dev-env
cd $HOME/.dev-env

if [[ ! -e "dev-env" ]]; then
  git clone
fi

if [[ ! -d "debian-java-development-environment" && ! -f "src/main/ansible/main.yml" ]]; then
  git clone https://github.com/gordonforce/debian-java-development-environment
  cd debian-java-development-environment
fi

# Step 3: Run the main playbook
# Determine the correct path to the main.yml file
if [[ -f "main.yml" ]]; then
  ansible-playbook main.yml
elif [[ -f "src/main/ansible/main.yml" ]]; then
  cd src/main/ansible
  ansible-playbook main.yml
  cd - > /dev/null
elif [[ -f "${HOME}/debian-java-development-environment/src/main/ansible/main.yml" ]]; then
  cd ${HOME}/debian-java-development-environment/src/main/ansible
  ansible-playbook main.yml
  cd - > /dev/null
else
  echo "Error: Could not find main.yml playbook"
  exit 1
fi
