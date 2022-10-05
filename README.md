# CyberCSA-lab-template
Cyberysecurity Advanced - lab environment template

This environment is used by the involved lecturers in the course to build up the lab set-up using ansible. 
It provides the base netwerk + hosts; tweaking is done manually after this step.

## Network design
The entire network is built up in VirtualBox, using Vagrant.

![network-overview](network-overview.png)

### Management network
All nodes have a eth0, connecting them via NAT to the Internet. Range: 10.0.2.0/24.

### Production network
The network consists of 2 company-LANs, attached to a router:
* a LAN network for the Servers: 172.30.42.0/26
    * Network address         - 172.30.42.0
    * Network mask            - 255.255.255.192
    * Network mask (bits)     - 26
    * Broadcast address       - 172.30.42.63
    * Addresses in network    - 64
    * Network range           - 172.30.42.0 - 172.30.42.63
    * Usable range            - 172.30.42.1 - 172.30.42.62
* a LAN network for the employees - 172.30.128.0/25: DHCP for these networks is provided by the router. This network is located behind a NAT.
    * Network address         - 172.30.128.0
    * Network mask            - 255.255.255.128
    * Network mask (bits)     - 25
    * Broadcast address       - 172.30.128.127
    * Addresses in network    - 128
    * Network range           - 172.30.128.0 - 172.30.128.127
    * Usable range            - 172.30.128.1 - 172.30.128.126

The router itself also has an uplink to the host OS. It is considered as the WAN entry point of the company network. This host-only network can also be used to connect a Kali VM to attack the company premises. DHCP is coming from VirtualBox for this network.
* 192.168.56.0/24: DHCP is provided by the WAN provider
    * Network address         - 192.168.56.0
    * Network mask            - 255.255.255.0
    * Network mask (bits)     - 24
    * Broadcast address       - 192.168.56.255
    * Addresses in network    - 256
    * Network range           - 192.168.56.0 - 192.168.56.255
    * Usable range            - 192.168.56.1 - 192.168.56.254

VirtualBox also provides a management network, so the hosts can download software from the internet and are accessible by SSH. This network is located behind a NAT.
* Management network: 10.0.2.0/24
    * Network address         - 10.0.2.0
    * Network mask            - 255.255.255.0
    * Network mask (bits)     - 24
    * Broadcast address       - 10.0.2.255
    * Addresses in network    - 256
    * Network range           - 10.0.2.0 - 10.0.2.255
    * Usable range            - 10.0.2.1 - 10.0.2.254

## Machines overview

Name      | Network   | IP             | prefixlength | default gateway | Remarks
--------- | --------- | -------------- | ------------ | --------------- | ---
router    | uplink    | 10.0.2.15      | 24           | 10.0.2.2        | Default virtualbox nat
router    | servers   | 172.30.42.62   | 26           | nvt             | 
router    | employees | 172.30.128.126 | 25           | nvt             | 
router    | host-only | 192.168.56.254 | 24           | nvt             | <-- interface to ssh too from host
web       | servers   | 172.30.42.2    | 26           | 172.30.42.62    | Webserver
database  | servers   | 172.30.42.3    | 26           | 172.30.42.62    | Lightweight MySQL Database
employee1 | employees | DHCP           | 25           | 172.30.128.126  | Ubuntu
red       | host-only | TODO student   | 25           | 172.30.128.126  | Kali outside the network (at the beginning), ip + routing is a todo for student
dc        | servers   | 172.30.42.4    | 26           | 172.30.42.62    | Windows AD server core with domain
employee2 | employees | DHCP           | 25           | 172.30.128.126  | Windows 10 client (domain joined) 


# Big overview / Planning

## Les 1

- Installatie van de omgeving
- Herhaling DNS + Wireshark met een gegeven capture van de omgeving
- Huiswerk: kali installeren

## Les 2

- Kali: ip setup + routering zodat kali vanaf host-only network aan alles kan
- Nmap vanaf de kali naar de machines, hydra als demo, smbclient
- DOEL: zorg ervoor dat de kali vanaf host-only enkel nog kan surven naar www.insecure.cyb (web op poort 80/443) (en daardoor dus ook DC 53) rest moet geblokt worden met nftables

## Les 3 

- Installeer ELK in afzonderlijke vm (neem snapshot na clean install voor gastles)
- Experimenteer met ELK door de apache log in lezen van web (eerst configureren) 
(optioneel lab: veel ram/CPU nodig)
- Installeer full Security Onion en zorg dat router en win10 zijn logs naar SO shipped (filebeat en winlogbeat)

## Les 4 

- Gastles 


## Les 5

- Reset ELK naar clean install
- Suricata op de rouder als IDS/IPS 
- Sysmon op windows 10 (demo psexec)
- Ship logs naar de ELK

## Les 6

Buffer

## Les 7

- Installeer een nieuwe vm OF configureer db (of ubuntu) als honeypot
- https://github.com/cowrie/cowrie 
- Zorg dat de SSH server op de webserver gebruik maakt van een andere poort dan 22. Gebruik SSH port forwarding om vervolgens poort 22 op de webserver te koppelen aan een poort van de honeypot. 

## Les 8

Buffer

## Users
* Thomas Clauwaert
* Martijn Saelens
* Andy Van Maele
