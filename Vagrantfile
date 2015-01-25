#!/usr/bin/env ruby
#^syntaxBOX detection

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.box_url = "https://vagrantcloud.com/chef/ubuntu-12.04"
  config.vm.provider "vmware_fusion" do |v|
    v.memory = 2048
  end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "172.28.100.10"



  config.vm.provision "shell", path: "provision.sh"

  config.trigger.after :up do
    # route all traffic for the docker ips to the vm host
    run "sudo route add 172.17.42.0/24 172.28.100.10"
  end

  config.trigger.after [:halt, :suspend, :destroy] do
    # remove the routing when the vm host is not running
    run "sudo route delete 172.17.42.0/24 172.28.100.10"
  end

  
end
