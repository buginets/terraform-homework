#!/bin/bash

function prepare_bastion() {
    sudo apt update
    sudo apt install ansible -y
    if [ ! -f /usr/share/keyrings/hashicorp-archive-keyring.gpg ]
    then
    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    fi
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform -y
}

function create_instance() {
    cd terraform
    terraform init
    terraform apply -auto-approve
}

function update_ip() {
    terraform output -raw ubuntu_public_ip > ../ansible/hosts
}

function ansible() {
    cd ../ansible
    ansible-playbook main.yml
}


prepare_bastion
create_instance
update_ip
# echo "Waiting 20 seconds"
# sleep 20
# ansible