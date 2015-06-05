# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.56.111"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "3500"]
    vb.customize ["modifyvm", :id, "--cpus", "3"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    #vb.gui = true
  end

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder './vm', '/home/vagrant', type: 'nfs_guest'
  config.vm.provision "shell", path: "bin/provision.sh"
end