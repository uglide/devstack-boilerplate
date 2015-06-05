#!/usr/bin/env bash

vagrant plugin install vagrant-nfs_guest
mkdir vm
vagrant up
cp conf/local.conf vm/devstack/