# SSH

1.  What are the essential elements to configure SSH properly:

    -   Logging in remotely using keys instead of user/password

            - Generate a key pair
            - Copy the public key to the server
            - Add the public key to the authorized_keys file
            - Set the correct permissions on the .ssh directory and authorized_keys file

    -   authorized_keys file

            The authorized_keys file is a list of public keys that are allowed to log in to the server. The file is located in the .ssh directory in the user's home directory.

    -   known-hosts file

            The known_hosts file is a list of public keys of servers that the client has connected to. The file is located in the .ssh directory in the user's home directory.

    -   SSH config for client and server

            The SSH config file is located in the .ssh directory in the user's home directory. The file can be used to configure the client and server.

    -   The difference between a passphrase on a key vs user/password

            A passphrase is an extra layer of security that is added to the key. The passphrase is used to encrypt the key, and it is required to decrypt the key. A user/password is used to authenticate the user to the server.

2.  What is meant by a Jump/Bastion host and why would a company use this?

        A jump/bastion host is a server that is used to access other servers in a network. The jump/bastion host is used to control access to the other servers in the network. Using a jump/bastion host can help to improve security by limiting access to the other servers in the network.

3.  What is the difference between local and remote port forwarding using SSH? You should be able to explain the difference using a proper use case.

        Local port forwarding forwards a local port on the client machine to a remote server through the SSH connection and is used for accessing a resource on a remote network that is not directly accessible from your local machine.

        Example: A database on a remote server (port 3306) is not exposed to the internet. You use local port forwarding:
            ssh -L 8080:localhost:3306 user@remote_server
        Now, you can connect to the database at localhost:8080 on your local machine as if it were local.


        Remote port forwarding forwards a remote port on the server to a local machine through the SSH connection and is used for exposing a resource on your local machine to a remote network.

        Example: You are running a web application locally on port 5000 and want to make it accessible to a remote server. Use remote port forwarding:
            ssh -R 8000:localhost:5000 user@remote_server
        Now, the remote server can access your application at localhost:8000.

4.  What is the SOCKS protocol conceptually and give an example where or when this might be interesting.

        The SOCKS protocol is a protocol that is used to route network traffic through a proxy server. The proxy server acts as an intermediary between the client and the server. The client sends its network traffic to the proxy server, which then forwards the traffic to the server. The server sends its response back to the proxy server, which then forwards the response back to the client.

        Example: You are in a country where certain websites are blocked. You can use the SOCKS protocol to route your network traffic through a proxy server in a different country where the websites are not blocked. This allows you to access the blocked websites.
