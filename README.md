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
* a LAN network for the employees - 172.30.128.0/25: DHCP + DNS for these networks is provided by the router.
    * Network address         - 172.30.128.0
    * Network mask            - 255.255.255.128
    * Network mask (bits)     - 25
    * Broadcast address       - 172.30.128.127
    * Addresses in network    - 128
    * Network range           - 172.30.128.0 - 172.30.128.127
    * Usable range            - 172.30.128.1 - 172.30.128.126

The router itself also has an uplink to the Host OS. It is considered as the WAN entry point of the company network. This host-only network can also be used to connect a Kali VM to attack the company premises. DHCP is coming from VirtualBox for this network.
* WAN network: 10.0.2.0/24
    * Network address         - 10.0.2.0
    * Network mask            - 255.255.255.0
    * Network mask (bits)     - 24
    * Broadcast address       - 10.0.2.255
    * Addresses in network    - 256
    * Network range           - 10.0.2.0 - 10.0.2.255
    * Usable range            - 10.0.2.1 - 10.0.2.254

## Machines overview

Name      | Network   | IP                | prefixlength  | default gateway | Remarks
--------- | --------- | ----------------- | ------------- | --------------- | ---
router    | outside   | DHCP              | 24            | ???             | Router of the environment
router    | servers   | 172.30.42.1       | 26            | ???             | ^
router    | employees | 172.30.128.1      | 25            | ???             | ^
web       | servers   | 172.30.42.2       | 26            | 172.30.42.1     | Webserver
database  | servers   | 172.30.42.3       | 26            | 172.30.42.1     | Lightweight MySQL Database
employee1 | employees | DHCP              | 25            | 172.30.128.1    | Ubuntu
red       | employees | DHCP              | 25            | 172.30.128.1    | Kali outside the network
dc        | servers   | 172.30.42.4       | 26            | 172.30.42.1     | Windows AD server core with domain
employee2 | employees | DHCP              | 25            | 172.30.128.1    | Windows 10 client (domain joined) 


# Vragen voor de omgeving

## Les 1 

Maak een netwerkschema van de gegeven opstelling. Probeer volgende vragen te beantwoorden en mee te nemen in je overzicht: 

- Welke machines kunnen met elkaar communiceren?
- Wat is de default gateway van elke machine?
- Wat is de dns-server van elke machine?
- Welke machines hebben een statisch IP en welke gebruiken DHCP? 
- Welke users bestaan op welke machines?
- Wat is het doel (welke processen zijn essentieel) van elke machine?
- Onderzoek of de DNS server kwetsbaar is voor een DNS Zone Transfer aanval. Wat houdt deze aanval precies in? Indien nodig, probeer de server zodanig te configureren dat deze aanval niet meer kan. Documenteer deze update.

## Les 2 

(Gegeven, informatie over de omgeving: Users + Groups + Processen + Doelen)

- Gebruik Wireshark om na te gaan wat voor verkeer er passief op het netwerk passeert. Documenteer je bevindingen en ga na welke zaken je beter kan beveiligen of updaten. 
- Gebruik nmap om na te gaan welke poorten open staan op de machines. Zijn deze allemaal nodig en zoja op welke interfaces moeten ze beschikbaar zijn? Documenteer je bevindingen en ga na welke zaken je beter kan beveiligen.
- Configuur de router zodanig dat de functionaliteit van het netwerk niet verloren gaat maar dat het netwerk beter gesegmenteerd is. Maak eventueel gebruik van zoning. Welke machines moeten bereikbaar zijn van buitenaf en welke niet?


## Les 3 

- Zet een nieuwe virtuele machine op die dient als "Honeypot" om je webserver beter te beschermen. Kies gerust welke technology je hier voor wilt gebruiken. Een suggestie is bijvoorbeeld https://github.com/cowrie/cowrie 
- Zorg dat de SSH server op de webserver gebruik maakt van een andere poort dan 22. Gebruik SSH port forwarding om vervolgens poort 22 op de webserver te koppelen aan een poort van de honeypot. 


## Les 4 

- Buffer / Gastles


## Les 5

- Laat enkel de Router, de domein controller en de webserver draaien. Installeer Splunk in een nieuwe virtuele machine en configuur de Windows server en de webserver zodanig dat alle commando's die uitgevoerd worden op de machines gelogt en geraadpleegd kunnen worden in splunk. Documenteer goed hoe je dit gedaan hebt. 

OF

- Splunk skippen en houden voor security onion, hier een vrij theorie/inputles van maken met de concepten en de praktische plaatsen waar logs gestored worden en waarom we wat doorsturen naar zaken als splunk/ELK. Dit is misschien beter om concepteel het goed te snappen maar dan moeten lessen 6 buffer en les 7 wisselen.

- Test dit uit door <TODO use case>

## Les 6

- Buffer

## Les 7 

- Bouw een SOC uit door security onion te installeren in een nieuwe virtuele machine.



## Users
* Thomas Clauwaert
* Martijn Saelens
* Andy Van Maele
