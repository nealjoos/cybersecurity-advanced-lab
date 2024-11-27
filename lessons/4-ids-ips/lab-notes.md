# IDS/IPS

1.  Ask yourself which system (or systems) in the network layout of the company would be best suited to install IDS/IPS software on. Revert back to the original network diagram of the initial setup and answer the same questions as well.

        Companyrouter would be the best device to install IDS/IPS software on.

    -   What traffic can be seen?

              All traffic that goes through the companyrouter, which is all traffic between the internal networks and the internet.

    -   What traffic (if any) will be missed and when?

              Traffic within the same internal network will be missed.

2.  For this exercise, disable the firewall so that you can reach the database. Install tcpdump on the machine where you will install Suricata on and increase the memory (temporary if needed) to 4GB. Reboot if necessary.

3.  Verify that you see packets (in tcpdump) from red to the database. Try this by issuing a ping and by using the hydra mysql attack as seen previously. Are you able to see this traffic in tcpdump? What about a ping between the webserver and the database?

        It is possible to see the traffic between the red and database machines in tcpdump when the red machine is connected to the fake internet LAN.
        The ping between the webserver and the database is also visible in tcpdump since the traffic goes through the companyrouter.

4.  Install and configure the Suricata software. Keep it simple and stick to the default configuration file(s) as much as possible. Change the interface to the one you want to sniff on in the correct Suricata configuration file. Focus on 1 interface when starting out!

5.  Create your own alert rules.

    -   What is the difference between the fast.log and the eve.json files?

            The fast.log file contains the alerts that are triggered by the rules in the Suricata configuration file. The eve.json file contains the same information as the fast.log file, but in JSON format.

    -   Create a rule that alerts as soon as a ping is performed between two machines (for example red and database)

            alert icmp any any -> any any (msg:"ICMP packet detected"; sid:1000001;)

    -   Test your out-of-the-box configuration and browse on your red machine to http://www.cybersec.internal/cmd and enter "id" as an evil command. Does it trigger an alert? If not, are you able to make it trigger an alert?

            Yes, it triggers an alert after running `sudo suricata-update`.

    -   Create an alert that checks the mysql tcp port and rerun a hydra attack to check this rule. Can you visually see this bruteforce attack in the fast.log file? Tip: monitor the file live with an option of tail.

            `alert tcp any any -> 172.30.0.15 3306 (msg:"MySQL port"; sid:1000002; rev:1;)`

    -   Go have a look at the Suricata documentation. What is the default configuration of Suricata, is it an IPS or IDS?

            The default configuration of Suricata is an IDS.

    -   What do you have to change to the setup to switch to the other (IPS or IDS)? You are free to experiment more and go all out with variables (for the networks) and rules. Make sure you can conceptually explain why certain rules would be useful and where (= from which subnet to which subnet) they should be applied?

6.  To illustrate the difference between an IPS and firewall, enable the firewall and redo the hydra attack through an SSH tunnel. Can you make sure that Suricata detects this attack as an IPS? Do you understand why Suricata can offer this protection whilst a firewall cannot? What is the difference between an IPS and firewall? On which layers of the OSI-model do they work?

        Suricata can detect the attack as an IPS because it can inspect the packets that go through the firewall. The firewall can only block or allow packets based on the rules that are configured. The difference between an IPS and a firewall is that an IPS can inspect the packets that go through the firewall and block them if they are malicious. An IPS works on the application layer of the OSI-model, while a firewall works on the network layer.

7.  An IPS/IDS needs to be tuned thoroughly to prevent alerting fatigue, so it is good that you learn how to write your own rules. Fortunately, there are also rule sets out there that can help you. Read the rule management documentation for Suricata and import the Emerging Threats Open ruleset. Find a way to demonstrate that these additional rules work.

        The Emerging Threats Open ruleset can be imported by running `sudo suricata-update`. The rules can be found in the `/var/lib/suricata/rules` directory. The proof that the rules work is that the fast.log file contains alerts that are triggered when running the `id` command on the web server remote code execution page.
