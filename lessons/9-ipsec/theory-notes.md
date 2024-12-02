# IPsec

1.  What is the fundamental goal of IPsec?

        IPsec is a protocol suite that provides security services at the IP layer. It is used to secure communication between two hosts, between two networks, or between a host and a network. The fundamental goal of IPsec is to provide confidentiality, integrity, and authenticity of data.

2.  How does IPsec work? What are SP's and SA's?

        IPsec works by creating Security Associations (SA's) between two hosts. A Security Association is a one-way relationship between two hosts that defines the security parameters for the communication between them. Each SA is uniquely identified by a Security Parameter Index (SPI). A Security Policy (SP) is a set of rules that define the security parameters for a particular type of traffic. The SP's are used to determine which SA to use for a particular packet.

3.  What modes exist in IPsec? What is the difference?

        IPsec can operate in two modes: Transport mode and Tunnel mode. In Transport mode, only the payload of the IP packet is encrypted and/or authenticated. The IP header is left intact. In Tunnel mode, the entire IP packet is encrypted and/or authenticated. A new IP header is added to the packet, which contains the IP addresses of the two hosts.

4.  What is AH?

        AH (Authentication Header) is an IPsec protocol that provides data integrity and authentication for IP packets. It does this by adding a header to the IP packet that contains a cryptographic hash of the packet data. The hash is computed using a shared secret key between the two hosts.

5.  What is ESP?

        ESP (Encapsulating Security Payload) is an IPsec protocol that provides confidentiality, data integrity, and authentication for IP packets. It does this by encrypting the payload of the IP packet and adding a header that contains a cryptographic hash of the encrypted data. The encryption and authentication are done using a shared secret key between the two hosts.

6.  What is IKE?

        IKE (Internet Key Exchange) is a protocol used to establish Security Associations (SA's) between two hosts. It is used to negotiate the security parameters for the communication between the hosts, such as the encryption algorithm, authentication method, and key exchange method. IKE uses a Diffie-Hellman key exchange to establish a shared secret key between the hosts.
