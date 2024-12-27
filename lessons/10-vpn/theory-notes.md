# VPN

1.  Review some downsides of IPsec

        - IPsec can be complex to configure and manage.
        - IPsec can be difficult to troubleshoot.
        - IPsec can have compatibility issues between different implementations.
        - IPsec can have performance overhead due to the encryption and decryption of packets.
        - IPsec can have scalability issues with large numbers of hosts.
        - IPsec can have security vulnerabilities if not configured correctly.

2.  Review what a CA is and how it works?

        A Certificate Authority (CA) is a trusted entity that issues digital certificates. These digital certificates are used to verify the identity of users, devices, or services on a network. The CA acts as a trusted third party that vouches for the authenticity of the information contained in the certificate. When a user or device presents a certificate signed by the CA, other parties can trust that the information in the certificate is accurate and that the user or device is who they claim to be.

3.  Review how it is possible for us to browse to https://chamilo.hogent.be and don't receive a warning in our browser? How does this work. You should be able to fully explain this in detail. Note: the final lesson/lab will help with this

        When you browse to a website using HTTPS, the website presents a digital certificate to your browser. This certificate is signed by a trusted Certificate Authority (CA) that vouches for the authenticity of the website. Your browser has a list of trusted CAs that it uses to verify the certificate. If the CA that signed the certificate is in the list of trusted CAs, your browser will accept the certificate and establish a secure connection to the website. If the CA is not in the list of trusted CAs, your browser will display a warning message indicating that the certificate is not trusted.

4.  What is the goal of OpenVPN?

        The goal of OpenVPN is to provide a secure and reliable VPN solution that can be used to connect remote users or networks to a central network over the Internet. OpenVPN uses a combination of open-source technologies to create a secure tunnel between the client and server, allowing data to be transmitted securely over the Internet.

5.  How does OpenVPN work? What are the crucial elements to have a working OpenVPN setup?

        OpenVPN works by creating a secure tunnel between the client and server using the SSL/TLS protocol. The client and server exchange digital certificates to authenticate each other and establish an encrypted connection. Once the connection is established, data can be transmitted securely over the Internet.

        The crucial elements to have a working OpenVPN setup are:

        - A server running the OpenVPN software
        - A client running the OpenVPN software
        - Digital certificates for the server and client
        - A configuration file that specifies the settings for the server and client
        - A network connection between the client and server
        - A firewall rule that allows traffic to pass between the client and server

6.  What is PKI?

        PKI stands for Public Key Infrastructure. It is a system of digital certificates, public key encryption, and other technologies that are used to secure communications over the Internet. PKI provides a way to verify the identity of users, devices, or services on a network and to establish secure connections between them.

7.  What are the fundamental differences between IPsec and Openvpn:

    -   Do they work on the same layer of the OSI model?

            No, IPsec operates at the network layer (Layer 3) of the OSI model, while OpenVPN operates at the application layer (Layer 7) of the OSI model.

    -   Do they have the exact same goal?

            OpenVPN focusses on providing a secure and reliable VPN solution that can be used to connect remote users or networks to a central network over the Internet. IPsec is a suite of protocols that provides secure communication over the Internet by encrypting and authenticating IP packets.
            IPsec is more commonly used for site-to-site VPNs, while OpenVPN is more commonly used for remote access VPNs.

    -   What are reasons to use one over the other?

            - IPsec is built into the operating system and is widely supported by network devices, making it easy to deploy and manage.
            - OpenVPN is more flexible and can be used on a wider range of devices and operating systems.
            - OpenVPN is easier to configure and troubleshoot than IPsec.
            - OpenVPN can provide better performance than IPsec in some cases.
            - OpenVPN can be used to create point-to-point or site-to-site VPNs, while IPsec is typically used for site-to-site VPNs.
            - OpenVPN configuration is more user-friendly than IPsec configuration.

8.  Is wireguard more comparable to OpenVPN or to IPsec or to both? Explain.

        WireGuard is more comparable to IPsec than OpenVPN. WireGuard is a modern VPN protocol that is designed to be fast, secure, and easy to use. Like IPsec, WireGuard operates at the network layer (Layer 3) of the OSI model and provides secure communication over the Internet by encrypting and authenticating IP packets. WireGuard is built into the Linux kernel and is designed to be lightweight and efficient, making it a good choice for embedded devices and low-power systems. WireGuard is also designed to be easy to configure and manage, with a simple and user-friendly configuration file format.
