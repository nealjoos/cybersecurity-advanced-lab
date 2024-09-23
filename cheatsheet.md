# Cheat sheet to copy paste from

## On your host

Add a route, example for Windows:

`route add 172.30.0.0 mask 255.255.0.0 192.168.62.254`

### If Windows/WSL

`find ansible/ -type f -print0 | xargs -0 dos2unix`

## From Ansible installed machine

`ansible fake_internet --inventory ansible/inventory.yml --module-name ping`

`ansible-playbook --inventory ansible/inventory.yml ansible/playbook.yml`

Reboot isprouter, companyrouter, homerouter 

`ansible all --inventory ansible/inventory.yml --module-name ping`

`ansible-playbook --inventory ansible/inventory.yml ansible/webserver.yml`
`ansible-playbook --inventory ansible/inventory.yml ansible/dns.yml`
`ansible-playbook --inventory ansible/inventory.yml ansible/database.yml`