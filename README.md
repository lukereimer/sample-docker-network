#Sample Docker Network

This is a very simple Vagrantfile with a few tricks that allow you to access services running in Docker containers  on the VM from your Mac.

**There is absolutely no security around this!**

The [vagrant-trigger plugin](https://github.com/emyl/vagrant-triggers) is required to use this Vagrantfile

## Provisioning Script

The provision script does a few simple things:
- Install docker
- explicitly specify the ipv4 range for the docker bridge
- nat all traffic comes into VM on the docker bridge ip range over to the docker bridge

## Vagrant triggers

The Vagrantfile uses the [vagrant-triggers plugin](https://github.com/emyl/vagrant-triggers)

On *vagrant up* create a route on the mac to send all traffic in the designated docker range to the VM as a gateway

remove the same route on *vagrant down*, *halt* or *suspend*

