#!/bin/bash

function prepare_bastion() {
    if command -v packer &> /dev/null
then
    echo "✅ Packer is already installed: $(packer version)"
else
    echo "🚀 Installing Packer..."
    sudo apt update
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

    sudo apt-add-repository --yes "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    
    sudo apt-get update && sudo apt-get install  -y packer
    echo "✅ Packer installed: $(packer version)"
fi
    
    }

function run_packer {
    cd packer-wordpress
    sudo chmod +x install_wordpresss.sh
    
    packer init wordpress.pkr.hcl
    packer validate wordpress.pkr.hcl
    packer build wordpress.pkr.hcl
}    

prepare_bastion
# sleep 60
run_packer

