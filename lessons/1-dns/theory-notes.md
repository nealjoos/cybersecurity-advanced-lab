# DNS

1.  What is the swiss cheese model and how can it be applied to cybersecurity?

        In modern cybersecurity, where new vulnerabilities and attack vectors are discovered all the time on a constantly shifting threat landscape, a multi-layered defensive strategy is no longer just a luxury, it’s a necessity.

        A visual example of this approach is the Swiss cheese model, which portrays the need for having numerous independent layers of protections that overlap to eliminate risks. Unlike a single barrier, with a multilayered approach, in case of failure at one layer, others stand prepared to withstand potential breaches. This adds significant resilience to the cybersecurity landscape

2.  What different type of network attacks exist?

    -   What is a (D)DoS attack?

            A distributed denial-of-service (DDoS) attack is a malicious attempt to disrupt the normal traffic of a targeted server, service or network by overwhelming the target or its surrounding infrastructure with a flood of Internet traffic.

    -   How can DNS be considered an attack vector as well?

            DNS can be an attack vector because it is essential to internet communication, and attackers exploit its vulnerabilities in various ways, including:

                -   DNS Spoofing/Poisoning: Redirecting users to malicious websites by corrupting DNS records.
                -   DNS Tunneling: Using DNS queries to exfiltrate data or establish covert communication channels.
                -   DDoS Attacks: Overwhelming DNS servers with traffic to disrupt services.
                -   Registrar Hijacking: Taking control of domain registrations to redirect or manipulate traffic.
                -   Amplification Attacks: Using DNS responses in reflection attacks to amplify DDoS traffic.

            Securing DNS with technologies like DNSSEC and monitoring can mitigate these threats.

3.  DNS:

    -   What information can be enumerated from a DNS server?

            Domain names, IP addresses, mail servers, name servers, service records, text records and zone transfers.

    -   When is it intended? What is considered a "normal" DNS resolve and how can you perform it using a CLI tool?

            It is intended when you want to resolve a domain name to an IP address. You can perform a normal DNS resolve using the `nslookup` command.

    -   What is, and how can you perform a reverse lookup?

            A reverse lookup is the process of finding the domain name associated with an IP address. You can perform a reverse lookup using the `nslookup` command.

    -   What is meant by authoritative nameservers?

            Authoritative nameservers are DNS servers that store the DNS records for a domain. They are the final authority on the DNS records for a domain.

    -   What is a zone transfer attack and why is it called an attack? Is a zone transfer always harmful?

            A zone transfer attack is when an attacker requests a copy of the DNS records for a domain from an authoritative nameserver. It is called an attack because it can reveal sensitive information about the domain, such as IP addresses and server names. A zone transfer is not always harmful, but it can be if the information is used maliciously.

4.  tcpdump (or alternatives)

    -   How can you create a network dump, only using the CLI, on a machine without a GUI?

            You can use the `tcpdump -w dump.pcap` command to create a network dump on a machine without a GUI.

    -   How can you exclude SSH traffic?

            You can exclude SSH traffic by using the `tcpdump not port 22` command.

    -   How can you only include HTTP traffic?

            You can only include HTTP traffic by using the `tcpdump port 80` command.

5.  Wireshark:

    -   See questions from 4 - tcpdump
    -   What can an analyst learn from the following windows inside wireshark:

        -   Conversations

                The Conversations window in Wireshark shows the network conversations between hosts, including the number of packets, bytes, and the protocol used.

        -   Statistics

                The Statistics window in Wireshark provides various statistics about the captured packets, such as packet length, packet rate, and protocol hierarchy.

        -   Protocol Hierarchy

                The Protocol Hierarchy window in Wireshark shows the breakdown of the captured packets by protocol, allowing the analyst to see which protocols are most prevalent on the network.
