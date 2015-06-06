#!/bin/bash

cd /vagrant

# update packages
sudo apt-get update
sudo apt-get build-dep python -y
sudo apt-get install git python-pip -y
sudo apt-get install postgresql postgresql-contrib -y
sudo pip install setuptools --upgrade
sudo apt-get purge cloud-init -y

git clone --depth 5 https://git.openstack.org/openstack-dev/devstack
chown -R vagrant devstack
sudo mkdir -p /opt/stack/
chown -R vagrant /opt/stack/


# Enable and configure swap
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cat <<EOF >> /etc/fstab
/swapfile   none    swap    sw    0   0
EOF

sudo sysctl vm.swappiness=10
sudo cat <<EOF >> /etc/sysctl.conf
vm.swappiness=10
EOF

cp conf/local.conf vm/devstack/