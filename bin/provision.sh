#!/bin/bash

cd /vagrant

# update packages
sudo apt-get update
sudo apt-get build-dep python -y
sudo apt-get install git python-pip -y
sudo apt-get install postgresql postgresql-contrib -y
sudo pip install setuptools --upgrade
sudo apt-get purge cloud-init -y

#prepare env
sudo chown -R vagrant /opt
sudo rm -fR /vagrant/stack
sudo rm -fR /vagrant/devstack

#get devstack
git clone https://git.openstack.org/openstack-dev/devstack
cp local.conf.dev devstack/local.conf

sudo chown -R vagrant devstack/
sudo chown -R vagrant /opt/stack/
cd devstack
