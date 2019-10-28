# -*- mode: ruby -*-
# vi: set ft=ruby :

# Resource checking and allocation
host_cpus = `grep "^processor" /proc/cpuinfo | wc -l`.to_i

if ENV.fetch('VAGRANT_CPUS', nil)
  guest_cpus = ENV['VAGRANT_CPUS'].to_i
else
  # Default to at least 2 cores
  guest_cpus = [host_cpus, 2].max
end

if ENV.fetch('VAGRANT_MEMORY', nil)
  guest_memory = ENV['VAGRANT_MEMORY'].to_i
else
  # Default to 1024 MB per core
  guest_memory = 2 * 1024
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/bionic64"

  # General configuration
  config.vm.define "vagrant-rails-dev"
  config.vm.box_check_update = false
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant"

  if ENV.fetch('VAGRANT_STORAGE', nil)
    # Custom storage configuration
    config.disksize.size = ENV['VAGRANT_STORAGE']
  end

  config.vm.network :forwarded_port, guest: 22, host: 2229, id: 'ssh'
  config.ssh.port = 2229

  # Postgresql Server
  config.vm.network :forwarded_port, guest: 5432, host: 5433

  # Rails
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.network :private_network, ip: "10.10.10.12", virtualbox_intnet: true

  # Virtualbox config
  config.vm.provider "virtualbox" do |vb, override|

    vb.name = "vagrant_rails_dev_vm"
    vb.gui = false

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", guest_memory]
    vb.customize ["modifyvm", :id, "--acpi",   "on"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus",   guest_cpus]

    # change the network card hardware for better performance
    vb.customize ["modifyvm", :id, "--nictype1", "virtio" ]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio" ]

    # suggested fix for slow network performance
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision/playbook.yml"
    ansible.verbose = 'v'
    ansible.extra_vars = {
      ansible_python_interpreter: "/usr/bin/python3",
    }
  end
end