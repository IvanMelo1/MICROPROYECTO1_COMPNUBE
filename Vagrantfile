# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  if Vagrant.has_plugin? "vagrant-vbguest"
  config.vbguest.no_install = true
  config.vbguest.auto_update = false
  config.vbguest.no_remote = true
  end
  config.vm.define :web1 do |web1|
  web1.vm.box = "bento/ubuntu-22.04"
  web1.vm.network :private_network, ip: "192.168.100.2"
  web1.vm.hostname = "web1"
  web1.vm.provision "shell", path: "script.sh", args: ["web1"]
  end
  config.vm.define :web2 do |web2|
  web2.vm.box = "bento/ubuntu-22.04"
  web2.vm.network :private_network, ip: "192.168.100.3"
  web2.vm.hostname = "web2"
  web2.vm.provision "shell", path: "script.sh", args: ["web2"]
  end
  config.vm.define :proxy do |proxy|
  proxy.vm.box = "bento/ubuntu-22.04"
  proxy.vm.network :private_network, ip: "192.168.100.4"
  proxy.vm.hostname = "proxy"
  proxy.vm.provision "shell", path: "script_p.sh"
  end 
end






