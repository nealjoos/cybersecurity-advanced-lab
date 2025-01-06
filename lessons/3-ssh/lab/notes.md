# What are the essential elements to configure SSH properly:

## Logging in remotely using keys instead of user/password

## authorized_keys file

The SSH authorized_keys file is a file that contains a list of public keys that are authorized to log in to the server. This file is used to prevent unauthorized users from connecting to the SSH server.

## known-hosts file

The ssh known_hosts file is a file that stores the public key of all of the servers that you have connected using ssh.

## SSH config for client and server

ssh web for example should automatically login to the webserver. This is perfectly possible from your host system!

Config for client: see config file
Config for server: no additional settings / default config

## The difference between a passphrase on a key vs user/password

The passphrase on a key protects the private key from being usable when copied by an attacker without knowing the password. If no password is set on the key, anyone who can copy the private key, can log in using it.

Using a user/password login, you can login using a user and password combination. This type of authentication is generally considered less safe than key authentication, since user/password credentials can be brute forced and key authentication not.

# What is meant by a Jump/Bastion host and why would a company use this?

A Bastion Host (or a jump server) is a dedicated computer used to access infrastructure resources and helps compartmentalize them. From a security perspective, a Bastion host is the only node in the network exposed for external access, that is probably the reason why a company would use this.

# What is the difference between local and remote port forwarding using SSH? You should be able to explain the difference using a proper use case.

Local port forwarding is used to forward a port from the client machine to the server machine. Basically, the client creates a connection to the server and then the server creates a connection to a remote host. The server forwards the data between the client and the remote host. An example of local port forwarding is to forward a port from a local computer to a server such as a web server (so that you can access a website that is blocked on your local network).

Remote port forwarding does the opposite: it forwards a port from the server to the client. An example of remote port forwarding is to forward a port from a server to a local computer. The server creates a connection to the client and the client creates a connection to a remote host. The server forwards the data between the client and the remote host. An example of remote port forwarding is to securely access a remote database that is blocked by a firewall.

# What is the SOCKS protocol conceptually and give an example where or when this might be interesting.

SOCKS is another internet protocol. It stands for SOCKet Secure and is commonly used for traffic-intensive tasks, like content streaming or P2P sharing. SOCKS uses a Transmission Control Protocol (TCP) connection that is designed to send and receive data packets across the internet, as well as to guarantee successful delivery of resources over networks.

When using SOCKS proxies, the internet traffic is routed through a proxy server via TCP connection on behalf of a client. Just like most other proxy types, SOCKS proxies hide the client’s IP address and serve when bypassing geo-restrictions.

Unlike HTTP, SOCKS cannot interpret web data. However, they are mostly used to facilitate communication with websites that have a firewall and limit regular client access. Most importantly, SOCKS proxies work on any kind of network protocol on any port.
