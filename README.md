# CyberCSA-lab-template

This environment is used to build up the lab set-up. It provides the base network and hosts. The entire network is built up in VirtualBox, using Vagrant.

## Network design

The network consists of 4 subnets:

-   172.30.0.0/16: **internal company LAN**.
-   192.168.62.254/24: **fake internet**.
-   172.10.0.0/24: **employee home LAN**.
-   10.0.2.0/24: **VirtualBox NAT network**.

:bulb: Tip: Linux and Mac users must first read https://www.virtualbox.org/manual/ch06.html#network_hostonly .

> On Linux, macOS and Solaris Oracle VM VirtualBox will only allow IP addresses in 192.168.56.0/21 range to be assigned to host-only adapters. For IPv6 only link-local addresses are allowed. If other ranges are desired, they can be enabled by creating /etc/vbox/networks.conf and specifying allowed ranges there. For example, to allow 10.0.0.0/8 and 192.168.0.0/16 IPv4 ranges as well as 2001::/64 range put the following lines into /etc/vbox/networks.conf:
>
> -   10.0.0.0/8 192.168.0.0/16
> -   2001::/64

```puml
@startuml
nwdiag {
    network internal {
        address = 172.30.0.0/16;
        description = "internal company LAN";

        companyrouter [address = "172.30.255.254"];
        dns [address = "172.30.0.4"];
        web [address = "172.30.0.10"];
        database [address = "172.30.0.15"];
    }

    network hostonly {
        address = "192.168.62.0/24";
        description = "fake internet";

        companyrouter [address = "192.168.62.253"];
        isprouter [address = "192.168.62.254"];
        red [address = "192.168.62.100"];
        your_laptop [address = "dhcp"];
        homerouter [address = "192.168.62.42"];
    }

    network employee {
        address = "172.10.0.0/24";
        description = "employee home LAN";

        homerouter [address = "172.10.10.254"];
        employee [address = "172.10.10.123"];
    }

    network nat {
        address = "10.0.2.0/24";
        description = "VirtualBox";

        isprouter [address = "10.0.2.15"];
        virtualbox_nat_gateway [address = "10.0.2.2"];
        virtualbox_nat_dns [address = "10.0.2.3"];
    }
}
@enduml
```

## Usage

1. Create the following host-only network in VirtualBox to simulate the the fake internet:

    -   Name: `vboxnet1` (when different, change this in `Vagrantfile`)
    -   IP range: 192.168.62.0/24

1. `vagrant up --parallel`

1. Disable all the NAT connections added by vagrant: `./disable-nat.sh`

1. Test connectivity with Ansible:

    ```console
    $ ansible fake_internet --inventory inventory.yml --module-name ping
    red | SUCCESS => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python3"
        },
        "changed": false,
        "ping": "pong"
    }
    [WARNING]: Platform linux on host isprouter is using the discovered Python interpreter at /usr/bin/python3.11, but future installation of another Python
    interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-core/2.16/reference_appendices/interpreter_discovery.html for more
    information.
    isprouter | SUCCESS => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python3.11"
        },
        "changed": false,
        "ping": "pong"
    }
    homerouter | SUCCESS => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python3"
        },
        "changed": false,
        "ping": "pong"
    }
    companyrouter | SUCCESS => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python3"
        },
        "changed": false,
        "ping": "pong"
    }
    ```
