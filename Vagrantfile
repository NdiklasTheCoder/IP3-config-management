# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # General Vagrant VM configuration.
  config.vm.box = "geerlingguy/ubuntu2004"
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider :virtualbox do |v|
    v.memory = 512
    v.linked_clone = true
  end

  # Application server 1.
  config.vm.define "clientapp" do |app|
    app.vm.hostname = "orc-app1.clientapp"
    app.vm.network :private_network, ip: "192.168.60.4"
  end

  # Application server 2.
  config.vm.define "serverapp" do |app|
    app.vm.hostname = "orc-app2.serverapp"
    app.vm.network :private_network, ip: "192.168.60.5"
  end

  # Database server.
  config.vm.define "dbapp" do |db|
     db.vm.hostname = "orc-db.dbapp"
    db.vm.network :private_network, ip: "192.168.60.6"
  end

  # Ansible provisioning.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yaml"
  end

end