# Cybersecurity-advanced-lab-template

This environment is used to build up the lab set-up. It provides the base network and hosts. The entire network is built up in VirtualBox, using Vagrant and Ansible.

## Network design

The network consists of 4 subnets:

-   172.30.0.0/16: **internal company LAN**.
-   192.168.62.254/24: **fake internet**.
-   172.10.10.0/24: **employee home LAN**.
-   10.0.2.0/24: **VirtualBox NAT network**.

```puml
@startuml
nwdiag {
    network internal_company_lan {
        address = 172.30.0.0/16;

        companyrouter [address = "172.30.255.254"];
        dns [address = "172.30.0.4"];
        web [address = "172.30.0.10"];
        database [address = "172.30.0.15"];
        employee [address = "172.30.0.123"];
    }

    network fake_internet {
        address = "192.168.62.0/24";

        companyrouter [address = "192.168.62.253"];
        isprouter [address = "192.168.62.254"];
        your_laptop [address = "dhcp"];
        homerouter [address = "192.168.62.42"];
    }

    network employee_home_lan {
        address = "172.10.0.0/24";

        homerouter [address = "172.10.10.254"];
        remote_employee [address = "172.10.10.123"];
    }

    network virtualbox_nat {
        address = "10.0.2.0/24";

        isprouter [address = "10.0.2.15"];
        virtualbox_nat_gateway [address = "10.0.2.2"];
        virtualbox_nat_dns [address = "10.0.2.3"];
    }

    real_internet [ shape = cloud];
    virtualbox_nat_gateway -- real_internet;
}
@enduml
```

## Usage

:bulb: Here, we use the isprouter VM as the controller, but if you want to work from WSL in Windows, you can read [these instructions](./installation-windows-wsl.md) instead.

1. Create the following host-only network in VirtualBox to simulate the the fake internet:

    - Name: `vboxnet1` (when different, for example on Windows: "VirtualBox Host-Only Ethernet Adapter #2", change this in the [`Vagrantfile`](./Vagrantfile))
    - IP range: 192.168.62.0/24

2. `vagrant up --parallel` or go slowly (1 by 1) and do `vagrant up <vm_name>`

3. Disable all the NAT connections added by vagrant: `./disable-nat.sh` or use `./disable-nat.ps1`

    :bulb: On Windows, if you receive an error about running scripts being disabled, make sure you understand what this is. A quick alternative is to copy over the contents in PowerShell ISE or in an interactive PowerShell window).

    :warning: `vagrant ssh` won't work anymore and that is **by design**! This command is also not available in a real network, so learn to use SSH properly: login into the required hosts using SSH with IP addresses and jump/forward options!

4. SSH into the isprouter VM:

    ```bash
    ssh vagrant@192.168.62.254
    ```

    :bulb: It could be that you have to wait a minute until the isprouter VM has booted and accepts SSH requests.

    :bulb: Vagrant boxes often use the following credentials:

    - username: `vagrant`
    - password: `vagrant`

5. Execute the following commands. This can take a while!

    ```bash
    isprouter:~$ cd ansible/
    isprouter:~/ansible$ find . -type f -print0 | xargs -0 dos2unix
    isprouter:~/ansible$ sudo ./run-on-isprouter.sh
    ...

    # Use the following command to check if the network is setup OK
    isprouter:~/ansible$ sudo ansible-playbook --inventory inventory.yml check.yml
    ```

    :bulb: We have added `dos2unix` here for Windows users, but why do they need this? Tip: Linux users don't need this. Tip2: `\r\n` vs. `\n`.
