# One Vagrantfile to rule them all!
#
# This is a generic Vagrantfile that can be used without modification in
# a variety of situations. Hosts and their properties are specified in
# `vagrant-hosts.yml`. Provisioning is done by a shell script in the directory
# `provisioning/` with the same name as the host name.
#
# See https://github.com/bertvv/vagrant-shell-skeleton/ for details

require 'rbconfig'
require 'yaml'

# set default LC_ALL for all BOXES
ENV["LC_ALL"] = "en_US.UTF-8"

# Set your default base box here
DEFAULT_BASE_BOX = 'bento/almalinux-9'

#
# No changes needed below this point
#

VAGRANTFILE_API_VERSION = '2'
PROJECT_NAME = '/' + File.basename(Dir.getwd)

hosts = YAML.load_file('vagrant-hosts.yml')

# {{{ Helper functions

def windows_host?
  Vagrant::Util::Platform.windows?
end

# Set options for the network interface configuration. All values are
# optional, and can include:
# - ip (default = DHCP)
# - netmask (default value = 255.255.255.0
# - mac
# - auto_config (if false, Vagrant will not configure this network interface
# - intnet (if true, an internal network adapter will be created instead of a
#   host-only adapter)
def network_options(host)
  options = {}

  if host.key?('ip')
    options[:ip] = host['ip']
    options[:netmask] = host['netmask'] ||= '255.255.255.0'
  else
    options[:type] = 'dhcp'
  end

  options[:mac] = host['mac'].gsub(/[-:]/, '') if host.key?('mac')
  options[:auto_config] = host['auto_config'] if host.key?('auto_config')
  ## changed true to host['intnet'] to add name of custom internal networks
  options[:virtualbox__intnet] = host['intnet'] if host.key?('intnet') && host['intnet']
  options
end

def custom_synced_folders(vm, host)
  return unless host.key?('synced_folders')
  folders = host['synced_folders']

  folders.each do |folder|
    vm.synced_folder folder['src'], folder['dest'], folder['options']
  end
end

# Adds forwarded ports to your Vagrant machine
#
# example:
#  forwarded_ports:
#    - guest: 88
#      host: 8080
def forwarded_ports(vm, host)
  if host.has_key?('forwarded_ports')
    ports = host['forwarded_ports']

    ports.each do |port|
      vm.network "forwarded_port", guest: port['guest'], host: port['host']
    end
  end
end

# }}}

### Template for Alma machines from bert startstructuur

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  hosts.each do |host|
    config.vm.define host['name'] do |node|
      node.vm.box = host['box'] ||= DEFAULT_BASE_BOX
      node.vm.box_url = host['box_url'] if host.key? 'box_url'

      node.vm.hostname = host['name']
      node.vm.network :private_network, network_options(host)
      custom_synced_folders(node.vm, host)
      forwarded_ports(node.vm, host)
      #node.ssh.insert_key = false

      # Add VM to a VirtualBox group
      node.vm.provider :virtualbox do |vb|
        vb.memory = host['memory'] if host.key? 'memory'
        vb.cpus = host['cpus'] if host.key? 'cpus'

        # WARNING: if the name of the current directory is the same as the
        # host name, this will fail.
        vb.customize ['modifyvm', :id, '--groups', PROJECT_NAME]
      end
            
      # Run configuration script for the VM
      node.vm.provision 'shell', path: 'provisioning/' + host['name'] + '.sh'
    end
  end

  ### Non-alma's or complex vbox machines, TODO make more flexibile with wrapper functions of bert

  config.vm.define "almarouter", primary: true do |almarouter|
    almarouter.vm.box = DEFAULT_BASE_BOX
    almarouter.vm.hostname = 'almarouter'
    #almarouter.ssh.insert_key = false
  
    almarouter.vm.network :private_network, ip: "172.30.42.10"
    almarouter.vm.network :private_network, ip: "172.30.42.130", virtualbox__intnet: "internal1"
    almarouter.vm.network :private_network, ip: "172.30.103.10", virtualbox__intnet: "internal2"
  
    almarouter.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 256]
      v.customize ["modifyvm", :id, "--name", "almarouter"]
    end
  end

  config.vm.define "alpinedb", primary: true do |alpinedb|
    alpinedb.vm.box = "generic/alpine316"
    alpinedb.vm.hostname = 'alpinedb'
    alpinedb.ssh.insert_key = false
  
    alpinedb.vm.network :private_network, ip: "172.30.42.134", virtualbox__intnet: "internal1"
  
    alpinedb.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 256]
      v.customize ["modifyvm", :id, "--name", "alpinedb"]
    end
  end

  config.vm.define "dc", primary: true do |dc|
    dc.vm.box = "gusztavvargadr/windows-server-core"
    dc.vm.hostname = 'dc'
    
  
    dc.vm.network :private_network, ip: "172.30.42.132", virtualbox__intnet: "internal1"
  
    dc.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "dc"]
    end
  end

  config.vm.define "winclient", primary: true do |winclient|
    winclient.vm.box = "gusztavvargadr/windows-10"
    winclient.vm.hostname = 'winclient'

    winclient.vm.network :private_network, type: "dhcp", virtualbox__intnet: "internal2"

    winclient.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "winclient"]
    end
  end

  config.vm.define "redkali", primary: true do |redkali|
    redkali.vm.box = "kalilinux/rolling"
    redkali.vm.hostname = 'redkali'

    redkali.vm.network :private_network, type: "dhcp"

    redkali.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "redkali"]
    end
  end

end






# -*- mode: ruby -*-
# vi: ft=ruby :
