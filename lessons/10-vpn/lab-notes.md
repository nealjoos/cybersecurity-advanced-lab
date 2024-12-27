# OpenVPN - practical installation

Password used for Easy RSA: `9000`

## Set up the PKI

Add Easy RSA to path:

```bash
export PATH=$PATH:/usr/share/easy-rsa/3
```

## Set up the CA

```bash
easyrsa init-pki
easyrsa build-ca
```

## Generate the server keys and certificate

```bash
easyrsa gen-req server
easyrsa sign-req server server
sudo openssl verify -CAfile /home/vagrant/pki/ca.crt  /home/vagrant/pki/issued/server.crt
```

## Generate the client keys and certificate

```bash
easyrsa gen-req client
easyrsa sign-req client client
sudo openssl verify -CAfile /home/vagrant/pki/ca.crt  /home/vagrant/pki/issued/client.crt
```

## Generate the Diffie-Hellman parameters

```bash
easyrsa gen-dh
```
