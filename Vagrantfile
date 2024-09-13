
# HOST_ONLY_NETWORK = "VirtualBox Host-Only Ethernet Adapter #2"
HOST_ONLY_NETWORK = "vboxnet1" # Typically on Linux/Mac
#HOST_ONLY_NETWORK = "VirtualBox Host-Only Ethernet Adapter #2" # Typically on Windows


Vagrant.configure("2") do |config|
    config.vm.define "companyrouter" do |host|
        host.vm.box = "almalinux/9"
        host.vm.hostname = "companyrouter"

        host.vm.network "private_network", ip: "192.168.62.253", netmask: "255.255.255.0", name: HOST_ONLY_NETWORK
        host.vm.network "private_network", ip: "172.30.255.254", netmask: "255.255.0.0", virtualbox__intnet: "internal-company-lan"

        host.vm.provider :virtualbox do |v|
            v.name = "companyrouter"
            v.cpus = "1"
            v.memory = "1024"
        end

        host.vm.provision "shell", inline: <<-SHELL
            # Default gateway
            nmcli connection modify "System eth1" ipv4.gateway 192.168.62.254
            nmcli connection down "System eth1" && nmcli connection up "System eth1"
        SHELL
    end

    config.vm.define "dns" do |host|
        host.vm.box = "generic/alpine318"
        host.vm.hostname = "dns"

        host.vm.network "private_network", ip: "172.30.0.4", netmask: "255.255.255.0", virtualbox__intnet: "internal-company-lan"

        host.vm.provider :virtualbox do |v|
            v.name = "dns"
            v.cpus = "1"
            v.memory = "256"
        end

        host.vm.provision "shell", inline: <<-SHELL
            # For ansible
            apk --no-cache add python3

            # Default gateway
            echo "gateway 172.30.255.254" >> /etc/network/interfaces
            service networking restart
        SHELL
    end

    config.vm.define "web" do |host|
        host.vm.box = "almalinux/9"
        host.vm.hostname = "web"

        host.vm.network "private_network", ip: "172.30.0.10", netmask: "255.255.255.0", virtualbox__intnet: "internal-company-lan"

        host.vm.provider :virtualbox do |v|
            v.name = "web"
            v.cpus = "1"
            v.memory = "1024"
        end

        host.vm.provision "shell", inline: <<-SHELL
            # Default gateway
            nmcli connection modify "System eth1" ipv4.gateway 172.30.255.254
            nmcli connection down "System eth1" && nmcli connection up "System eth1"
        SHELL
    end

    config.vm.define "database" do |host|
        host.vm.box = "generic/alpine318"
        host.vm.hostname = "database"

        host.vm.network "private_network", ip: "172.30.0.15", netmask: "255.255.255.0", virtualbox__intnet: "internal-company-lan"

        host.vm.provider :virtualbox do |v|
            v.name = "database"
            v.cpus = "1"
            v.memory = "256"
        end

        host.vm.provision "shell", inline: <<-SHELL
            # For ansible
            apk --no-cache add python3

            # Default gateway
            echo "gateway 172.30.255.254" >> /etc/network/interfaces
            service networking restart
        SHELL
    end

    config.vm.define "employee" do |host|
        host.vm.box = "generic/alpine318"
        host.vm.hostname = "employee"

        # TODO DHCP
        host.vm.network "private_network", ip: "172.30.0.123", netmask: "255.255.255.0", virtualbox__intnet: "internal-company-lan"

        host.vm.provider :virtualbox do |v|
            v.name = "employee"
            v.cpus = "1"
            v.memory = "256"
        end

        host.vm.provision "shell", inline: <<-SHELL
            apk --no-cache add python3 # For ansible
        SHELL
    end

    config.vm.define "isprouter" do |host|
        host.vm.box = "generic/alpine318"
        host.vm.hostname = "isprouter"

        host.vm.network "private_network", ip: "192.168.62.254", netmask: "255.255.255.0", name: HOST_ONLY_NETWORK

        host.vm.provider :virtualbox do |v|
            v.name = "isprouter"
            v.cpus = "1"
            v.memory = "256"
        end

        host.vm.provision "shell", inline: <<-SHELL
            apk --no-cache add python3 # For ansible
        SHELL
    end

    config.vm.define "homerouter" do |host|
        host.vm.box = "almalinux/9"
        host.vm.hostname = "homerouter"

        host.vm.network "private_network", ip: "192.168.62.42", netmask: "255.255.255.0", name: HOST_ONLY_NETWORK
        host.vm.network "private_network", ip: "172.10.10.254", netmask: "255.255.255.0", virtualbox__intnet: "employee-home-lan"

        host.vm.provider :virtualbox do |v|
            v.name = "homerouter"
            v.cpus = "1"
            v.memory = "1024"
        end

        host.vm.provision "shell", inline: <<-SHELL
            # Default gateway
            nmcli connection modify "System eth1" ipv4.gateway 192.168.62.254
            nmcli connection down "System eth1" && nmcli connection up "System eth1"
        SHELL
    end

    config.vm.define "remote_employee" do |host|
        host.vm.box = "almalinux/9"
        host.vm.hostname = "remote_employee"

        host.vm.network "private_network", ip: "172.10.10.123", netmask: "255.255.255.0", virtualbox__intnet: "employee-home-lan"

        host.vm.provider :virtualbox do |v|
            v.name = "remote_employee"
            v.cpus = "1"
            v.memory = "1024"
        end

        host.vm.provision "shell", inline: <<-SHELL
            # Default gateway
            nmcli connection modify "System eth1" ipv4.gateway 172.10.10.254
            nmcli connection down "System eth1" && nmcli connection up "System eth1"
        SHELL
    end

    config.vm.define "debug" do |host|
        host.vm.box = "generic/alpine318"
        host.vm.hostname = "debug"

        host.vm.network "private_network", ip: "192.168.62.123", netmask: "255.255.255.0", name: HOST_ONLY_NETWORK

        host.vm.provider :virtualbox do |v|
            v.name = "debug"
            v.cpus = "1"
            v.memory = "256"
        end

        host.vm.provision "shell", inline: <<-SHELL
            # For ansible
            apk --no-cache add python3

            # Default gateway
            echo "gateway 192.168.62.254" >> /etc/network/interfaces
            service networking restart
        SHELL
    end
end
