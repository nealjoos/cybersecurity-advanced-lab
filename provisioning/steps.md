# Steps to fully provision the environment

(still a lot manual steps :( )

## VirtualBox

```bash

& 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe' dhcpserver add --network=employees --server-ip=172.30.128.1 --netmask=255.255.255.128 --lowerip=172.30.128.20 --upperip=172.30.128.30 --disable

& 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe' dhcpserver add --network=servers --server-ip=172.30.42.1 --netmask=255.255.255.192 --lowerip=172.30.42.20 --upperip=172.30.42.30 --disable

VBoxManage.exe hostonlyif create

# take note and connect red kali manually afterwards

```

## Vagrant up 

## As soon router is up and running


```bash
# two times
vagrant ssh router

sudo dnf update -y && sudo dnf install nc python3-pip vim sshpass samba-client -y && python3 -m pip install --user ansible && python3 -m pip install pywinrm

# note run above thing twice for some reason pywinrm gets killed first time

vim inventory

# copy paste the following in inventory
[router]
localhost

[router:vars]
ansible_user=vagrant
ansible_password=vagrant
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[web]
172.30.42.2

[web:vars]
ansible_user=vagrant
ansible_password=vagrant
ansible_ssh_common_args='-o StrictHostKeyChecking=no'


[database]
172.30.42.3

[database:vars]
ansible_user=vagrant
ansible_password=vagrant
ansible_ssh_common_args='-o StrictHostKeyChecking=no'


[employee1]
172.30.128.10

[employee1:vars]
ansible_user=vagrant
ansible_password=vagrant
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[red]

[red:vars]
ansible_user=vagrant
ansible_password=vagrant
ansible_ssh_common_args='-o StrictHostKeyChecking=no'


[dc]
172.30.42.4

[dc:vars]
ansible_user=vagrant
ansible_password=vagrant
ansible_connection=winrm
ansible_winrm_server_cert_validation=ignore

[win10]
172.30.128.11

[win10:vars]
ansible_user=vagrant
ansible_password=vagrant
ansible_connection=winrm
ansible_winrm_server_cert_validation=ignore

# end of inventory



scp -r * vagrant@192.168.56.254:/home/vagrant/

ansible-galaxy install -r requirements.yml



vim /home/vagrant/.ansible/roles/bertvv.dhcp/vars/RedHat.yml 
#--> change to >= 


vim /home/vagrant/.ansible/roles/bertvv.mariadb/templates/etc_yum.repos.d_mariadb.repo.j2 
#---> last centos to rhel

vim /home/vagrant/.ansible/roles/bertvv.mariadb/vars/RedHat-9.yml

#contents-----

# roles/mariadb/vars/RedHat.yml
---

mariadb_packages:
  - MariaDB-common
  - MariaDB-server
  - python3-PyMySQL

mariadb_socket: /var/lib/mysql/mysql.sock

mariadb_config_network: /etc/my.cnf.d/network.cnf
mariadb_config_server: /etc/my.cnf.d/server.cnf
mariadb_config_custom: /etc/my.cnf.d/custom.cnf

###################

# check and edit inventory to be sure and run playbooks

ansible-playbook -i inventory provisioning/router-playbook.yml
ansible-playbook -i inventory provisioning/web-playbook.yml
ansible-playbook -i inventory provisioning/web-deploy-insecurewepapp.yml
ansible-playbook -i inventory provisioning/database-playbook.yml

# no insecuredbplaybook, do it manually

vagrant ssh database
sudo mysql

CREATE USER 'root'@'%' IDENTIFIED BY 'password';
CREATE USER 'bdup'@'%' IDENTIFIED BY 'bdup';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'bdup'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

sudo systemctl restart mysql 

```

## DC

```bash

vagrant ssh dc 

powershell

(Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1).content | iex


# on router

ansible-playbook -i inventory provisioning/dc-playbook-part1.yml

vagrant ssh dc
ssh walt@localhost
-- vanaf dc

cd C:\wip
powershell
./ad-import.ps1
./share.ps1
./dns.ps1

-- op dc

## voor de dns
$h = @("dc", "@", "DomainDnsZones", "ForestDnsZones")
foreach($i in $h) { Remove-DnsServerResourceRecord -ZoneName insecure.cyb -RecordData "10.0.2.15" -RRType "A" -Name $i -Force }

# neet to lookup name of the interface :/
# src: https://learn.microsoft.com/en-us/previous-versions//cc959739(v=technet.10)?redirectedfrom=MSDN
# ls "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\"
# | select name for copying
# for one interface 
# Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{26710610-0533-463e-a3b5-0e79443a7bde}" -Name DisableDynamicUpdate -Value 1
# for all interfaces but seems to fail :()
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\" -Name DisableDynamicUpdate -Value 1


```

## Employee1 (ubuntu)

```bash

vagrant ssh employee1
sudo vim /etc/ssh/sshd_config
#-- put PasswordAuthentication to yes
sudo systemctl restart sshd
#-- double check ip in inventory: ip a should show 192.168.56.10


# on router

ansible-playbook -i inventory provisioning/employee1-playbook.yml
ansible-playbook -i inventory provisioning/employee1-makeinsecure.yml

```

## Employee2 (win10)

```bash

vagrant ssh employee2
powershell

# ipconfig to double check ip in inventory should show 192.168.56.11

(Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1).content | iex

ansible-playbook -i inventory provisioning/win10-playbook.yml

$user = "walt@insecure.cyb" ; $p = convertto-securestring -String "Friday13th!" -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $user, $p

add-computer -domainname insecure.cyb -credential $cred -restart

#IN GUI WIN10
#
#--na reboot inloggen als walt/Friday13th!
#
#add optional feature > rsat > server manager, dns tools, ad ds
#
#language settings > region > Belgium
#language settings > put it on top

# go to c:\wip and install nmap (first!) and wireshark
# install phone home script (as walt!)


# on router
sudo firewall-cmd --zone=public --add-port 9001/tcp --permanent
sudo firewall-cmd --zone=public --add-port 9002/tcp --permanent
sudo firewall-cmd --reload


# to check
nc -lvnkp 9001
```

## Red (kali)

```bash

# set up static ip

sudo vim /etc/network/interfaces

# add
auto eth1
iface eth1 inet static
address 192.168.56.199/24
#gateway 192.168.56.254


sudo vim /etc/resolv.conf
# change

search insecure.cyb
nameserver 172.30.42.4


sudo systemctl restart networking

ip route add 172.30.0.0/16 via 192.168.56.254


# test with
#update db
# locate psexec
/usr/bin/impacket-psexec walt@172.30.42.4
/usr/bin/impacket-psexec walt@172.30.128.11

```