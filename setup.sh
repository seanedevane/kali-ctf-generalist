#!/bin/bash

# Exit immediately on failure

set -e

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as sudo or root."
    exit 1
fi

echo "Installing the CTF Generalist Kali build."

echo "--------------------------------------------"
echo "              Installing pip                "
echo "--------------------------------------------"

# Install pip before we do anything else
curl -sL https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py --user --no-warn-script-location

export PATH=$PATH:/root/.local/bin

echo "--------------------------------------------"
echo "              Installing Ansible            "
echo "--------------------------------------------"

pip3 install ansible

echo "Setting up fonts..."
# Setup fonts
mkdir ~/Scripts
pushd ~/Scripts > /dev/null
git clone https://github.com/powerline/fonts
popd > /dev/null
pushd ~/Scripts/fonts > /dev/null
chmod +x install.sh
./install.sh
popd > /dev/null

echo "--------------------------------------------"
echo "          Running Ansible playbook          "
echo "          This may take some time           "
echo "--------------------------------------------"

ansible-playbook ./kali.yml