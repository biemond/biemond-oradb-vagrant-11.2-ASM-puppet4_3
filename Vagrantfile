# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "dbasm", primary: true do |dbasm|

    dbasm.vm.box = "centos-6.8-x86_64"
    dbasm.vm.box_url = "https://dl.dropboxusercontent.com/s/7875ao1yenb2gcv/centos-6.8-x86_64.box"

    dbasm.vm.provider :vmware_fusion do |v, override|
      override.vm.box = "centos-6.8-x86_64-vmware"
      override.vm.box_url = "https://dl.dropboxusercontent.com/s/sfzbfhilc5665io/centos-6.8-x86_64-vmware.box"
    end

    dbasm.vm.hostname = "dbasm.example.com"
    dbasm.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]
    dbasm.vm.synced_folder "/Users/edwinbiemond/software", "/software"

    dbasm.vm.network :private_network, ip: "10.10.10.7"

    dbasm.vm.provider :vmware_fusion do |vb|
      vb.vmx["numvcpus"] = "2"
      vb.vmx["memsize"] = "7548"
    end

    dbasm.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm"     , :id, "--memory", "7548"]
      vb.customize ["modifyvm"     , :id, "--name"  , "dbasm"]
      vb.customize ["modifyvm"     , :id, "--cpus"  , 2]
    end

    dbasm.vm.provision :shell, :inline => "mkdir -p /etc/puppet;ln -sf /vagrant/puppet/hiera.yaml /etc/puppet/hiera.yaml;rm -rf /etc/puppet/modules;ln -sf /vagrant/puppet/modules /etc/puppet/modules"

    dbasm.vm.provision :puppet do |puppet|

      puppet.environment_path     = "puppet/environments"
      puppet.environment          = "development"

      puppet.manifests_path       = "puppet/environments/development/manifests"
      puppet.manifest_file        = "site.pp"

      # puppet.manifests_path    = "puppet/manifests"
      # puppet.module_path       = "puppet/modules"
      # puppet.manifest_file     = "site.pp"
      #puppet.options           = "--verbose --hiera_config /vagrant/puppet/hiera.yaml"

      puppet.options           = [
                                  '--verbose',
                                  '--report',
                                  '--trace',
#                                  '--debug',
#                                  '--parser future',
                                  '--strict_variables',
                                  '--hiera_config /vagrant/puppet/hiera.yaml'
                                 ]

      puppet.facter = {
        "environment" => "development",
        "vm_type"     => "vagrant",
      }

    end

  end

  config.vm.define "dbclient", primary: true do |dbclient|

    dbclient.vm.box = "centos-6.8-x86_64"
    dbclient.vm.box_url = "https://dl.dropboxusercontent.com/s/7875ao1yenb2gcv/centos-6.8-x86_64.box"

    dbclient.vm.provider :vmware_fusion do |v, override|
      override.vm.box = "centos-6.8-x86_64-vmware"
      override.vm.box_url = "https://dl.dropboxusercontent.com/s/sfzbfhilc5665io/centos-6.8-x86_64-vmware.box"
    end

    dbclient.vm.hostname = "dbclient.example.com"
    dbclient.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]
    dbclient.vm.synced_folder "/Users/edwinbiemond/software", "/software"

    dbclient.vm.network :private_network, ip: "10.10.10.8"

    dbclient.vm.provider :vmware_fusion do |vb|
      vb.vmx["numvcpus"] = "2"
      vb.vmx["memsize"] = "2548"
    end

    dbclient.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm"     , :id, "--memory", "2548"]
      vb.customize ["modifyvm"     , :id, "--name"  , "dbclient"]
      vb.customize ["modifyvm"     , :id, "--cpus"  , 2]
    end

    dbclient.vm.provision :shell, :inline => "mkdir -p /etc/puppet;ln -sf /vagrant/puppet/hiera.yaml /etc/puppet/hiera.yaml;rm -rf /etc/puppet/modules;ln -sf /vagrant/puppet/modules /etc/puppet/modules"

    dbclient.vm.provision :puppet do |puppet|

      puppet.environment_path     = "puppet/environments"
      puppet.environment          = "development"

      puppet.manifests_path       = "puppet/environments/development/manifests"
      puppet.manifest_file        = "client.pp"

      # puppet.manifests_path    = "puppet/manifests"
      # puppet.module_path       = "puppet/modules"
      # puppet.manifest_file     = "site.pp"
      #puppet.options           = "--verbose --hiera_config /vagrant/puppet/hiera.yaml"

      puppet.options           = [
                                  '--verbose',
                                  '--report',
                                  '--trace',
                                  # '--debug',
#                                  '--parser future',
                                  '--strict_variables',
                                  '--hiera_config /vagrant/puppet/hiera.yaml'
                                 ]

      puppet.facter = {
        "environment" => "development",
        "vm_type"     => "vagrant",
      }

    end

  end


end
