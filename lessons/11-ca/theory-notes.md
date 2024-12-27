# CA

1.  Assume your browser gives and error when browsing to a HTTPS website, telling you that the certificate is not valid anymore (for example expired). If you however decide to accept the risk and continue. Is your traffic still encrypted or not? Explain.

        The traffic is still encrypted. The certificate is used to verify the identity of the server, and to establish a secure connection. If the certificate is expired, the browser can't verify the identity of the server, but the connection is still encrypted. The browser doesn't know if the server is the one it claims to be, but the connection is still encrypted.

2.  What is X.509?

        X.509 is a standard that defines the format of public key certificates. It is widely used in SSL/TLS to establish secure connections between clients and servers.

3.  What is meant by CSR in this context?

        CSR stands for Certificate Signing Request. It is a message sent from an applicant to a Certificate Authority (CA) to apply for a digital identity certificate. The CSR contains the applicant's public key and some information about the applicant.

4.  What is SAN, Subject Alternative Name?

        SAN stands for Subject Alternative Name. It is an extension to the X.509 standard that allows a certificate to specify additional hostnames or IP addresses that it is valid for. This is useful for certificates that are used for multiple domains or subdomains.

5.  What are Certificate chains and cross-certifications?

        Certificate chains are a series of certificates that are used to verify the identity of a server. The server's certificate is signed by an intermediate CA, which is signed by a root CA. The root CA's certificate is self-signed, and is trusted by the client.

        Cross-certifications are certificates that are signed by two different CAs. This is used when two CAs want to establish trust between each other. The CAs sign each other's certificates, so that they can trust each other's certificates.

    -   How does a CA certificate renewal work using a cross-certification (note: there are alternative methods, we want you to understand (and be able to explain) the image you can find on wikipedia) ?

        When a CA certificate is renewed, the new certificate is signed by the old certificate. The old certificate is still valid, so the new certificate can be trusted. The new certificate is then used to sign the certificates of the servers that the CA issues certificates for. The old certificate is eventually phased out, and the new certificate is used to sign the certificates of the servers.

        ![Cross-certification](https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Cross-certification_diagram.svg/800px-Cross-certification_diagram.svg.png)

6.  What is the difference between SSL and TLS? What is currently the standard? Which version?

        SSL (Secure Sockets Layer) and TLS (Transport Layer Security) are cryptographic protocols that are used to establish secure connections between clients and servers. SSL was developed by Netscape in the 1990s, and TLS is the successor to SSL. TLS is currently the standard, and the most recent version is TLS 1.3.

    -   Is MD5 still used in the most recent version?

        No, MD5 is not used in TLS 1.3. MD5 is a cryptographic hash function that is considered to be weak and insecure. It has been replaced by more secure hash functions in TLS 1.3, such as SHA-256.

7.  What is Let's Encrypt?

        Let's Encrypt is a non-profit Certificate Authority that provides free SSL/TLS certificates to website owners. The certificates are issued using an automated process, and are valid for 90 days. Let's Encrypt is widely used by website owners who want to secure their websites with HTTPS.

    -   Isn't it a bad thing that people - including hackers - can create webserver certificates that can be signed for free by a trusted CA that is installed in all recent devices? Explain why/not.

        It is not a bad thing that Let's Encrypt provides free SSL/TLS certificates. Let's Encrypt has strict validation procedures in place to verify the identity of the certificate applicant. This helps to prevent hackers from obtaining certificates for domains that they do not own. Let's Encrypt also has mechanisms in place to revoke certificates that are misused. The benefits of providing free SSL/TLS certificates to website owners outweigh the risks of misuse.
