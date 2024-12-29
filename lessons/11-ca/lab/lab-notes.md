# Certificate Authority

Used password is always `9000`.

## Create certificates

**On isprouter**

1. Create a private key for the CA

    ```bash
    openssl genrsa -aes256 -out CSA-RootCA.key 4096
    ```

2. Create certificate of the CA

    ```bash
    openssl req -x509 -new -nodes -key CSA-RootCA.key -sha256 -days 1826 -out CSA-RootCA.crt
    ```

3. Create the webserver certificate request

    ```bash
    openssl req -new -nodes -out web.csr -newkey rsa:4096 -keyout web.key
    ```

4. Create a v3 ext file for SAN properties

    ```bash
    cat > web.v3.ext << EOF
    authorityKeyIdentifier=keyid,issuer
    basicConstraints=CA:FALSE
    keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
    subjectAltName = @alt_names

    [alt_names]
    DNS.1 = www.cybersec.internal
    DNS.2 = *.cybersec.internal
    EOF
    ```

5. Sign the certificate

    ```bash
    openssl x509 -req -in web.csr -CA CSA-RootCA.crt -CAkey CSA-RootCA.key -CAcreateserial -out web.crt -days 90 -sha256 -extfile web.v3.ext
    ```

6. Copy the certificates to the webserver

    ```bash
    scp web.crt web.key 172.30.64.10:~/
    ```

## Configurate the webserver

**On web**

1. Become root

    ```bash
    sudo -i
    ```

2. Create a directory for the certificates and copy the certificates to that directory

    ```bash
    mkdir /etc/httpd/ssl
    cp /home/vagrant/web.crt /etc/httpd/ssl/
    cp /home/vagrant/web.key /etc/httpd/ssl/
    ```

3. Install the mod_ssl package

    ```bash
    dnf install mod_ssl -y
    ```

4. Copy the contents of `00-https-reverse-proxy.conf` to `/etc/httpd/conf.d/00-https-reverse-proxy.conf`.
5. Restart the httpd service

    ```bash
    systemctl restart httpd
    ```

## Test the setup

**Using curl**

1. On `isprouter`: transfer the CA certificate to the client

    ```bash
    scp CSA-RootCA.crt vagrant@IP_CLIENT:~/
    ```

2. On the client: add the CA certificate to the trusted certificates

    ```bash
    sudo cp CSA-RootCA.crt /etc/pki/ca-trust/source/anchors/
    sudo update-ca-trust
    ```

3. Open the website in the browser
   `bash
    curl https://www.cybersec.internal
    `
   **Using the browser**

# Resources

-   https://arminreiter.com/2022/01/create-your-own-certificate-authority-ca-using-openssl/
-   https://linuxconfig.org/how-to-setup-ssl-tls-with-apache-httpd-on-red-hat
-   https://httpd.apache.org/docs/current/mod/mod_ssl.html
-   https://www.digitalocean.com/community/tutorials/how-to-use-apache-http-server-as-reverse-proxy-using-mod_proxy-extension
