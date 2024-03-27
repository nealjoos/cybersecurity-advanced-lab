# ENV['VAGRANT_NO_PARALLEL'] = 'yes'

# First create the following network in VirtualBox: 192.168.62.0/24 (fake internet)

Vagrant.configure("2") do |config|

    name = "companyrouter"
    config.vm.define name do |host|
      host.vm.box = "almalinux/9"
      host.vm.hostname = name
  
      host.vm.network "private_network", ip: "172.30.255.254", netmask: "255.255.0.0", virtualbox__intnet: "internal-company"
      host.vm.network "private_network", ip: "192.168.62.253", netmask: "255.255.255.0", name: "vboxnet1"
  
      host.vm.provider :virtualbox do |v|
        v.name = name
        v.cpus = "1"
        v.memory = "2048"
      end
    end
  
  #   config.vm.define "dc" do |host|
  #     host.vm.box = "gusztavvargadr/windows-server-core"
  #     host.vm.hostname = "dc"
  
  #     host.vm.network "private_network", ip: "172.30.0.4", netmask: "255.255.255.0", virtualbox__intnet: "internal-company"
  
  #     host.vm.provider :virtualbox do |v|
  #       v.name = "dc"
  #       v.cpus = "2"
  #       v.memory = "4096"
  #     end
  #   end
  
  #   config.vm.define "employee1" do |host|
  #     host.vm.box = "gusztavvargadr/windows-11"
  #     host.vm.hostname = "employee1"
  
  #     host.vm.network "private_network", type: "dhcp", virtualbox__intnet: "internal-company"
  
  #     host.vm.provider :virtualbox do |v|
  #       v.name = "employee1"
  #       v.cpus = "2"
  #       v.memory = "4096"
  #     end
  #   end
  
    config.vm.define "web" do |host|
      host.vm.box = "almalinux/9"
      host.vm.hostname = "web"
  
      host.vm.network "private_network", ip: "172.30.0.10", netmask: "255.255.255.0", virtualbox__intnet: "internal-company"
  
      host.vm.provider :virtualbox do |v|
        v.name = "web"
        v.cpus = "1"
        v.memory = "2048"
      end
  
    end
  
    config.vm.define "database" do |host|
      host.vm.box = "almalinux/9"
      host.vm.hostname = "database"
  
      host.vm.network "private_network", ip: "172.30.0.15", netmask: "255.255.255.0", virtualbox__intnet: "internal_network"
  
      host.vm.provider :virtualbox do |v|
        v.name = "database"
        v.cpus = "1"
        v.memory = "2048"
      end
    end
  
    config.vm.define "isprouter" do |host|
      host.vm.box = "generic/alpine318"
      host.vm.hostname = "isprouter"
  
      host.vm.network "private_network", ip: "192.168.62.254", netmask: "255.255.255.0", name: "vboxnet1"
  
      host.vm.provider :virtualbox do |v|
        v.name = "isprouter"
        v.cpus = "1"
        v.memory = "2048"
      end

      config.vm.provision "shell", inline: "apk --no-cache add python3"
    end
  
    config.vm.define "red" do |host|
      host.vm.box = "kalilinux/rolling"
      host.vm.hostname = "red"
  
      host.vm.network "private_network", ip: "192.168.62.100", netmask: "255.255.255.0", name: "vboxnet1"
  
      host.vm.provider :virtualbox do |v|
        v.name = "red"
        v.cpus = "2"
        v.memory = "2048"
      end
    end
  end
  
  