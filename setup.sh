#!/bin/sh


REPOSITORY_URL=""

# Ensure Apple's command line tools are installed
if ! which cc >/dev/null; then
  echo "Installing Xcode Command Line Tools"
  xcode-select --install
  echo ">> Done"
else
  echo "Xcode already installed. Skipping."
fi

if ! which brew >/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Registering Homebrew"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  echo ">> Done"
else
  echo "Homebrew already installed. Skipping."
fi

# [Install Ansible](http://docs.ansible.com/intro_installation.html).
if ! which ansible >/dev/null; then
  echo "Installing Ansible ..."
  brew install ansible 
  echo ">> Done"
else
  echo "Ansible already installed. Skipping."
fi

# Clone the repository to your local drive.
if [ -d "/tmp/apps" ]; then
  echo "Temporary directory exists. Removing ..."
  rm -rf /tmp/apps
fi
# echo "Cloning setup repository"
# git clone https://github.com/siyelo/laptop.git 

# echo "Changing to laptop repo dir ..."
# cd laptop

# Run this from the same directory as this README file. 
echo "Running ansible playbook ..."
ansible-pull $REPOSITORY_URL
