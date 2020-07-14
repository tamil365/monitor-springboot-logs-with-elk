# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
  
  config.vm.define "elkserver" do |elkserver|
    elkserver.vm.box = "centos/7"
    elkserver.vm.hostname = "elkserver.eduami.org"
    elkserver.vm.network "private_network", ip: "192.168.50.22"
    elkserver.vm.network "forwarded_port", guest: 5601, host: 5601
    elkserver.vm.network "forwarded_port", guest: 9200, host: 9200
    elkserver.vm.provision "shell", path: "startup-elk.sh"
    elkserver.vm.provider "virtualbox" do |vb|
      vb.name = "elkserver"
      vb.memory = 8024
      vb.cpus = 1
    end
  end
  config.vm.define "sbclient" do |sbclient|
    sbclient.vm.box = "centos/7"
    sbclient.vm.hostname = "sbclient.eduami.org"
    sbclient.vm.network "private_network", ip: "192.168.50.23"
    sbclient.vm.network "forwarded_port", guest: 8080, host: 8080
    sbclient.vm.provision "shell", path: "startup-sbclient.sh"
    sbclient.vm.provider "virtualbox" do |vb|
      vb.name = "sbclient"
      vb.memory = 1024
      vb.cpus = 1
    end
  end
end
