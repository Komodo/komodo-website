# Windows hosts need: vagrant plugin install vagrant-winnfsd

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :forwarded_port, guest: 4567, host: 4567
  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder '.', '/vagrant', nfs: true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  	vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.provision :shell, path: "vagrant.sh"
  
  #config.vm.provision "shell",
  #  inline: "nohup middleman server >> /vagrant/middleman.log 2>&1 &"
end