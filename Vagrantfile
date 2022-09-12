Vagrant.configure("2") do |config|
  config.vm.provision "ansible", host_key_checking: true do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
  end

  ### router ###################################################################

  config.vm.define "router" do |host|
    host.vm.box = "almalinux/9"
    host.vm.hostname = "router"

    host.vm.network "private_network", type: "dhcp"
    host.vm.network "private_network", ip: "172.30.42.1", netmask: "255.255.255.192", virtualbox__intnet: "servers"
    host.vm.network "private_network", ip: "172.30.128.1", netmask: "255.255.255.128", virtualbox__intnet: "employees"

    host.vm.provider :virtualbox do |v|
      v.name = "router"
      v.cpus = "1"
      v.memory = "2048"
    end
  end

  ### servers ##################################################################

  config.vm.define "web" do |host|
    host.vm.box = "almalinux/9"
    host.vm.hostname = "web"

    host.vm.network "private_network", ip: "172.30.42.2", netmask: "255.255.255.192", virtualbox__intnet: "servers"

    host.vm.provider :virtualbox do |v|
      v.name = "web"
      v.cpus = "1"
      v.memory = "2048"
    end
  end

  config.vm.define "database" do |host|
    host.vm.box = "generic/alpine316"
    host.vm.hostname = "database"

    host.vm.network "private_network", ip: "172.30.42.3", netmask: "255.255.255.192", virtualbox__intnet: "servers"

    host.vm.provider :virtualbox do |v|
      v.name = "database"
      v.cpus = "1"
      v.memory = "2048"
    end
  end

  config.vm.define "domaincontroller" do |host|
    host.vm.box = "gusztavvargadr/windows-server-core"
    host.vm.hostname = "domaincontroller"

    host.vm.network "private_network", ip: "172.30.42.4", netmask: "255.255.255.192", virtualbox__intnet: "servers"

    host.vm.provider :virtualbox do |v|
      v.name = "domaincontroller"
      v.cpus = "1"
      v.memory = "2048"
    end
  end

  ### employees ################################################################

  config.vm.define "employee1" do |host|
    host.vm.box = "ubuntu/jammy64"
    host.vm.hostname = "employee1"

    host.vm.network "private_network", type: "dhcp", virtualbox__intnet: "employees"

    host.vm.provider :virtualbox do |v|
      v.name = "employee1"
      v.cpus = "1"
      v.memory = "2048"
    end
  end

  config.vm.define "employee2" do |host|
    host.vm.box = "gusztavvargadr/windows-10"
    host.vm.hostname = "employee2"

    host.vm.network "private_network", ip: "172.30.128.4", netmask: "255.255.255.128", virtualbox__intnet: "employees"

    host.vm.provider :virtualbox do |v|
      v.name = "employee2"
      v.cpus = "1"
      v.memory = "2048"
    end
  end

  ## outside ##################################################################

  config.vm.define "red" do |host|
    host.vm.box = "kalilinux/rolling"
    host.vm.hostname = "red"

    host.vm.network "private_network", type: "dhcp"

    host.vm.provider :virtualbox do |v|
      v.name = "red"
      v.cpus = "1"
      v.memory = "2048"
    end
  end

end

