# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.provider "virtualbox" do |v|
    v.name = "komodo-www"
    v.customize ["modifyvm", :id, "--memory", "1024"]
    #enalbe symlinking for in shared folders this won't work on Windows any way.
    #NOTE: Windows, must launch CMD as Admin for this to work
    v.customize ["setextradata", :id,
                 "VBoxInternal2/SharedFoldersEnableSymlinksCreate//vagrant",
                 "1"]
  end
  config.vm.hostname = "komodo.web"
  config.vm.network :public_network#, bridge: "Ethernet adapter Local Area Connection"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "development.pp"
    puppet.options = ['--verbose']
  end
  # Install NVM to help with
  #config.vm.provision "shell", path: "install-nvm.sh"
end

