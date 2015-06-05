#!/usr/bin/env bash

sudo apt-get update
sudo apt-get build-dep python -y
sudo apt-get install git python-pip -y

git clone https://git.openstack.org/openstack-dev/devstack
chown -R vagrant devstack


