#!/usr/bin/env bash

apk add git ansible-core sshpass
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
ansible-galaxy collection install community.mysql
ansible-playbook --inventory inventory.yml playbook.yml
service network restart
ansible-playbook --inventory inventory.yml dns.yml
ansible-playbook --inventory inventory.yml database.yml
ansible-playbook --inventory inventory.yml webserver.yml
