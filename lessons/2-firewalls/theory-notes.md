# Firewalls

1.  In terms of the OSI model, what does a firewall do?

        A firewall operates at the network layer (Layer 3) and the transport layer (Layer 4) of the OSI model. It filters traffic based on rules defined by the administrator to allow or block traffic based on criteria such as source IP address, destination IP address, port number, and protocol.

2.  Review the advantages and disadvantages of a host-based firewall vs a network-based firewall.

        - Host-based firewall:

            - Advantages:
                - Protects the individual host from attacks.
                - Can be customized to the specific needs of the host.
                - Can provide additional security for applications running on the host.
            - Disadvantages:
                - Requires configuration on each host.
                - Can be resource-intensive on the host.
                - May not protect against network-based attacks.

        - Network-based firewall:
            - Advantages:
                - Protects multiple hosts on a network.
                - Can be centrally managed.
                - Can provide additional security for the entire network.
            - Disadvantages:
                - May not provide granular control for individual hosts.
                - Can introduce a single point of failure.
                - May require additional hardware or software.

3.  What is meant by network segmentation and what are network/firewall zones?

        Network segmentation is the practice of dividing a network into smaller subnetworks or zones to improve security and performance. Network/firewall zones are logical groupings of devices or systems based on their security requirements. For example, a network may have a DMZ (demilitarized zone) for public-facing servers, an internal zone for employee workstations, and a management zone for network infrastructure devices.

4.  What is a DMZ? How can you build this with 1 firewall vs 2 firewalls? Are there advantages?

        A DMZ (demilitarized zone) is a network segment that is isolated from the internal network and exposed to the public internet. It typically contains public-facing servers such as web servers, email servers, and DNS servers. A DMZ can be built with one firewall by using firewall rules to control traffic between the DMZ and the internal network. It can also be built with two firewalls, one between the internal network and the DMZ and one between the DMZ and the internet. The advantage of using two firewalls is that it provides an additional layer of security by creating a "buffer zone" between the internal network and the public internet.

5.  Nmap:

    -   When scanning a TCP or UDP port with nmap, what is the difference between open, filtered and closed? How is nmap able to make this conclusion?

            - Open: The port is open and actively accepting connections.
            - Filtered: The port is being filtered by a firewall or other security device, preventing nmap from determining its status.
            - Closed: The port is closed and not actively accepting connections.

            Nmap is able to make this conclusion by sending packets to the target port and analyzing the response. If the port responds with a SYN/ACK packet, it is considered open. If the port responds with an RST packet, it is considered closed. If nmap does not receive a response, it is considered filtered.

    -   Review cybersecurity and virtualisation: what is a banner grab and how do you do this using nmap?

            A banner grab is the process of retrieving information about a service running on a port, such as the version number and operating system. Nmap can perform a banner grab by sending specific requests to the target port and analyzing the response.

6.  Systemd

    -   Where can you find the existing systemd configuration files on a Linux system with systemd?

            The existing systemd configuration files can be found in the `/etc/systemd/system/` directory and the `/lib/systemd/system/` directory.

    -   Review the following systemctl subcommands: systemctl cat ..., systemctl show ..., systemctl edit ..., systemctl list-units, systemctl list-unit-files and systemctl daemon-reload.

            - `systemctl cat ...`: Displays the contents of a systemd unit file.
            - `systemctl show ...`: Displays detailed information about a systemd unit.
            - `systemctl edit ...`: Edits the configuration of a systemd unit.
            - `systemctl list-units`: Lists all active systemd units.
            - `systemctl list-unit-files`: Lists all available systemd unit files.
            - `systemctl daemon-reload`: Reloads the systemd manager configuration.

    -   How can you create your own systemd service? Note: you don't need to learn this out of the top of your head, but you should be able to interpret a given systemd unit file.

            Create a new file in the `/etc/systemd/system/` directory with a `.service` extension. Define the `[Unit]`, `[Service]`, and `[Install]` sections in the file. Add the necessary configuration options for the service, such as the `ExecStart` command. Save the file and run `systemctl daemon-reload` to reload the systemd manager configuration. Start and enable the service using `systemctl start <service>` and `systemctl enable <service>`.

    -   What are systemd-timers?

            Systemd-timers are a type of systemd unit that allows you to schedule and run tasks at specific times or intervals. They are similar to cron jobs but are managed by systemd.

7.  Proxy:

    -   What is a (forward) proxy?

            A forward proxy is an intermediary server that sits between the client and the internet. It forwards client requests to the internet and returns the responses to the client. It can be used to filter content, improve performance, and provide anonymity.

    -   What is a reverse proxy?

            A reverse proxy is an intermediary server that sits between the client and one or more backend servers. It forwards client requests to the backend servers and returns the responses to the client. It can be used to load balance traffic, provide SSL termination, and protect backend servers from direct exposure to the internet.

    -   How are (reverse) proxies related to load balancers? Do you know software that can do both?

            Load balancers can act as reverse proxies by distributing incoming client requests across multiple backend servers to improve performance and reliability. Software such as Nginx and HAProxy can act as both reverse proxies and load balancers.
