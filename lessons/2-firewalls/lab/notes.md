# Attacker virtual machine red

-   What routes do you need to add?

    I did not add any.

-   What is the default gateway?

    `192.168.62.254`

-   Does your red has internet? If not, is it possible? Why not OR how?

    Yes, as long isprouter is online.

# The insecure "fake internet" host only network

-   Use a web browser to browse to http://www.cybersec.internal

    Insecurity: http instead of https

-   Use a web browser to browse to http://www.cybersec.internal/cmd and test out this insecure application.

    The command execution is running as root.

-   Perform a default nmap scan on all machines.

    -   dns: 22 (ssh), 53 (dns)
    -   web: 22 (ssh), 80 (http), 111 (rpcbind), 8000 (http-alt), 9200 (wap-wsp)
    -   database: 22 (ssh), 3306 (mysql)
    -   employee: 22 (ssh)
    -   companyrouter: 22 (ssh), 111 (rpcbind)
    -   isprouter: 22 (ssh), 53 (dns)
    -   homerouter: 22 (ssh), 111 (rpcbind)
    -   remote-employee: 22 (ssh), 111 (rpcbind)

-   Enumerate the most interesting ports (you found in the previous step) by issuing a service enumeration scan (banner grab scan).

    -   What database software is running on the database machine? What version?

        MySQL 5.5.5-10.11.8-MariaDB

    -   Try to search for a nmap script to brute-force the database. Another (even easier tool) is called hydra (https://github.com/vanhauser-thc/thc-hydra). Search online for a good wordlist. For example "rockyou" or https://github.com/danielmiessler/SecLists We suggest to try the default username of the database software and attack the database machine. Another interesting username worth a try is "toor".

        Found credentials: username: toor, password: summer

    -   What webserver software is running on web?

        Apache httpd 2.4.57 ((AlmaLinux))

    -   Try the -sC option with nmap. What is this option?

        It runs a default script that tries to grab interesting information about the open services on the specified host.

-   Try to SSH (using vagrant/vagrant) from red to another machine. Is this possible?

Yes, every host is reachable.

# Network Segmentation

-   What is meant with the term "attack vector"?

An attack vector is a method of gaining unauthorized access to a network or computer system.

-   Is there already network segmentation done on the company network?

No, there is only one LAN where all hosts are connected to.

-   Remember what a DMZ is? What machines would be in the DMZ in this environment?

Demilitarized zone, it is a zone that should be accessible and is in between the internal and external network.

-   What could be a disadvantage of using network segmentation in this case? Tip: client <-> server interaction.

Making mistakes so the required services are not accessible anymore.

Configure the environment, and especially companyrouter, to make sure that the red machine is not able to interact with most systems anymore. The only requirements that are left for the red machine are:

-   Browsing to http://www.cybersec.internal should work. Note: you are allowed to manually add a DNS entry to the red machine to tell the system how to resolve "www.cybersec.internal" if necessary. Do be mindful why/when this is needed!
-   All machines in the company network should still have internet access
-   You should verify what functionality you might lose implementing the network segmentation. List out and create an overview of the advantages and disadvantages.
-   You should be able to revert back easily: Create proper documentation!

# Firewall

## Network topology

Create some new internal networks:

-   csa-dmz
-   csa-clients
-   csa-servers

## Changes made:

-   Changed device IPs and subnet masks according to the new network topology where required.
-   Changed default gateways where required.
-   Changed DNS records so it resolves correctly to the correct servers since the IPs have changed.

## nftables config

See nftables.nft

Apply the config using `sudo nft -f nftables.nft`
Revert to defaults using `sudo nft flush ruleset`

# Open, closed, filtered ports

Finish by performing a nmap scan to web on ports 80, 22 and 666. For port 80 you should see "open", what do you notice on port 22 and 666? Can you explain this result? Make your firewall insecure again and rerun the scan, analyze the differences. We expect you to learn and know the difference between open/closed/filtered!

## Result with firewall enabled

```bash
└─$ nmap 172.30.64.10 -p22,80,666
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-10-22 18:30 CEST
Nmap scan report for 172.30.64.10
Host is up (0.00083s latency).

PORT    STATE    SERVICE
22/tcp  filtered ssh
80/tcp  open     http
666/tcp filtered doom

Nmap done: 1 IP address (1 host up) scanned in 1.47 seconds
```

## Result with firewall disabled

```bash
└─$ nmap 172.30.64.10 -p22,80,666
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-10-22 18:32 CEST
Nmap scan report for 172.30.64.10
Host is up (0.00059s latency).

PORT    STATE  SERVICE
22/tcp  open   ssh
80/tcp  open   http
666/tcp closed doom

Nmap done: 1 IP address (1 host up) scanned in 0.15 seconds
```

## Conclusion

A filtered port is a port where nmap cannot determine whether the port is open or not because packet filtering prevents its probes from reaching the port.
