# Honeypots

1.  Why is `companyrouter`, in this environment, an interesting device to configure with a SSH honeypot? What could be a good argument to NOT configure the router with a honeypot service?

        The companyrouter will normally be a target for attackers. If the SSH credentials of the router are compromised, it is possible for an attacker to gain access to the company network. This is a good argument to configure the router with a honeypot service. A good argument to NOT configure the router with a honeypot service is that the router is a critical device in the network. If the honeypot service is not configured correctly, it could lead to a security breach.

2.  Change your current SSH configuration in such a way that the SSH server (daemon) is not listening on port 22 anymore but on port 2222.
3.  Install and run the cowrie software on the router and listen on port 22 - the default SSH server port.

        docker run -p 22:2222 cowrie/cowrie:latest

4.  Once configured and up and running, verify that you can still SSH to the router normally, using port 2222.
5.  Attack your router and try to SSH normally. What do you notice?

    -   What credentials work? Do you find credentials that don't work?

                Username: root - password: none

    -   Do you get a shell?

                Yes

    -   Are your commands logged? Is the IP address of the SSH client logged? If this is the case, where?

                Yes, the IP address of the SSH client is logged. The log file is located at `/var/log/cowrie/cowrie.log`. It can be accessed using Docker.

    -   Can an attacker perform malicious things?

    -   Are the actions, in other words the commands, logged to a file? Which file?

                Yes, the actions are logged to a file. The file is located at `/var/log/cowrie/tty/` and the filename is the IP address of the attacker.

    -   If you are an experienced hacker, how would/can you realize this is not a normal environment?

                The files in the `/etc/init.d` directory do all have the same contents.
