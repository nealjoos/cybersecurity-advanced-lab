# DNS

## Capture traffic using the CLI

-   Which interface on the companyrouter will you use to capture traffic from the dns to the internet?

    The interface at the internal side of the network.

-   Which interface on the companyrouter would you use to capture traffic from dns to employee?

    That's not possible.

-   Test this out by pinging from employee to the companyrouter and from employee to the dns. Are you able to see all pings in tcpdump on the companyrouter?

    No, only the pings that are passing through companyrouter are visible.

-   SSH from employee to the companyrouter. When scanning with tcpdump you will now see a lot of SSH traffic passing by. How can you start tcpdump and filter out this ssh traffic?

    `tcpdump tcp port 80`

-   Start the web VM. Find a way to capture only HTTP traffic and only from and to the webserver-machine. Test this out by browsing to http://www.cybersec.internal from the isprouter machine using curl. This is a website that should be available in the lab environment. Are you able to see this HTTP traffic? Browse on the employee client, are you able to see the same HTTP traffic in tcpdump, why is this the case?

    No, only the data that is passing through companyrouter is visible.

## Understanding the network + Attacker machine `red`

-   What did you have to configure on your red machine to have internet and to properly ping web?

    Network settings (IP, subnet mask, default gateway & dns)

-   What is the default gateway of each machine?

    See Packet Tracer file

-   What is the DNS server of each machine?

    See Packet Tracer file

-   Which machines have a static IP and which use DHCP?

    See Packet Tracer file

-   What (static) routes should be configured and where, how do you make it persistent?

    None

-   What is the purpose (which processes or packages for example are essential) of each machine?

-   Investigate whether the DNS server of the company network is vulnerable to a DNS zone transfer "attack" as discussed above. What exactly does this attack involve? If possible, try to configure the server to allow & prevent this attack. Document this update: How can you execute this attack or check if the DNS server is vulnerable and how can you fix it? Can you perform this "attack" both on Windows and Linux? Document your findings properly.

    A zone can be transfered using `dig axfr @nameserver domain_to_transfer`. `dig axfr @172.30.0.4 cybersec.internal` gives us the DNS zone.

    On Windows, nslookup can be used since it does not have `dig` installed.

    ```
    nslookup
    server nameserver
    set type=any
    ls -d domain_to_transfer
    ```

    **How to prevent this**

    The configuration of the DNS server (bind) is at `/etc/bind/named.conf` with following output:

    ```
    options {
        directory "/var/bind";
        allow-transfer { any; };  # Allow zone transfers from any machine
        listen-on { any; };       # Listen on all interfaces
        listen-on-v6 { any; };    # Listen on all IPv6 interfaces
        recursion yes;            # Enable recursion for forwarding other queries
        forwarders {
            192.168.62.254;       # Forward all other queries to this DNS server
        };
        allow-query { any; };     # Allow queries from any IP
    };

    zone "cybersec.internal" {
        type master;
        file "/var/bind/cybersec.internal";
        allow-transfer { any; };  # Allow zone transfers from any machine
    };
    ```

    Change allow-transfer from 'any' to the IP address of the allowed server(s), seperated with `;`.
