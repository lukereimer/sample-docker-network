#!/bin/bash

# add the up-to-date docker repo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update
# install docker and vim
apt-get install -y --force-yes lxc-docker-1.3.3 vim
# add the vagrant user to the docker group so that we don't have to sudo all docker commands
adduser vagrant docker
# Add Docker options to run our own internal dns service and restart docker
echo "DOCKER_OPTS=\"--bip=172.17.42.1/16" >> /etc/default/docker
service docker restart

# All traffice that comes to the VM in the docker range can be natted to the docker bridge
iptables -t nat -A POSTROUTING -d 172.18.42.0/24 -j ACCEPT



