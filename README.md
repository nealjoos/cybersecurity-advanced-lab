# CyberCSA-lab-template
Cyberysecurity Advanced - lab environment template

This environment is used by the involved lecturers in the course to build up the lab set-up using ansible. 
It provides the base netwerk + hosts; tweaking is done manually after this step.

## Network design
The entire network is built up in VirtualBox, using Vagrant.

### Management network
All nodes have a eth0, connecting them via NAT to the Internet. Range: 10.0.2.0/24.

### Production network
The network consists of 2 company-LANs, attached to a router:
* a server LAN - 172.30.42.0/26 (intnet)
* an employee LAN - 172.30.128.0/25 (intnet2)
DHCP + DNS for these networks is provided by the router.

The router itself has an uplink - it's third interface - to the Host OS. It is considered as the WAN entry point of the company network. 
This host-only network can also be used to connect a Kali VM to attack the company premises.
IP range: 172.30.103.0/24. DHCP is coming from VirtualBox for this network.

# Users
* Thomas Clauwaert
* Martijn Saelens
* Andy Van Maele
