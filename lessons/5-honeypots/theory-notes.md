# Honeypots

1.  What is a honeypot?

        A honeypot is a security mechanism set up to detect, deflect, or counteract attempts at unauthorized use of information systems. It generally consists of a computer, data, or a network site that appears to be part of a network but is actually isolated and monitored, and which seems to contain information or a resource of value to attackers.

2.  What type of honeypots exist? Make a distinction between function, use and what they try to achieve?

        - Email traps: The address isn't used for any purpose other than the spam trap, it's 100% certain that any mail coming to it is spam. All messages which contain the same content as those sent to the spam trap can be automatically blocked, and the source IP of the senders can be added to a denylist.
        - Decoy database: Can be set up to monitor software vulnerabilities and spot attacks exploiting insecure system architecture or using SQL injection, SQL services exploitation, or privilege abuse.
        - Malware honeypot: Mimics software apps and APIs to invite malware attacks. The characteristics of the malware can then be analyzed to develop anti-malware software or to close vulnerabilities in the API.
        - Spider honeypot: Intended to trap webcrawlers ('spiders') by creating web pages and links only accessible to crawlers. Detecting crawlers can help you learn how to block malicious bots, as well as ad-network crawlers.

3.  How do honeypots differ from honey-/canarytokens?

        A honeypot is a security mechanism set up to detect, deflect, or counteract attempts at unauthorized use of information systems. It generally consists of a computer, data, or a network site that appears to be part of a network but is actually isolated and monitored, and which seems to contain information or a resource of value to attackers. A canarytoken is a unique link that can be placed on a system or network. When the link is accessed, an alert is triggered, notifying the administrator that the system has been compromised.

4.  Review Docker in terms of security:

    -   Is Docker virtualisation (type 1 or type 2), emulation, simulation?

            Docker is best described as containerization technology, which is distinct from virtualization, emulation, and simulation, but shares some overlapping concepts.

    -   What are some security implications when using Docker? Is it considered to be more secure compared to virtual machines? Why (not)?

            Docker containers are less secure than virtual machines because they share the host system's kernel. This means that if an attacker gains access to the host system, they can potentially access all of the containers running on that system. However, Docker containers are more secure than traditional applications because they are isolated from each other and the host system.

    -   Would you use Docker to deploy a honeypot in production? Why (not)?

            Yes, but only if it is on a completely different network thant the production network. There shouldn't be any production containers running on the same host as the honeypot Docker host. An advantage is that the container can be easily destroyed and recreated if it is compromised.

5.  What is a canary- or honeytoken?

        A canarytoken is a unique link that can be placed on a system or network. When the link is accessed, an alert is triggered, notifying the administrator that the system has been compromised. A honeytoken is a unique piece of data that is placed on a system or network. When the data is accessed, an alert is triggered, notifying the administrator that the system has been compromised.
