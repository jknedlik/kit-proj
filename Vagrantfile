Vagrant.configure("2") do |config|

  config.vm.define "datamanager" do |datamanager|
    datamanager.vm.box = "debian/contrib-jessie64"
    datamanager.vm.provision "file", source: "./alice-xrootd-builder-docker-container/build/af-xrootd.deb", destination: "af-xrootd.deb"
    datamanager.vm.provision "file", source: "manager.cf", destination: "af-xrootd/xrootd_%i.cf"
    datamanager.vm.network "private_network", ip: "192.168.1.200"
    datamanager.vm.provision :shell, :path => "boot.sh"
    datamanager.vm.provision :shell, :path => "services.sh"
	  datamanager.vm.synced_folder "tmp/", "/home/vagrant/shfs"
  end

  config.vm.define "dataserver" do |dataserver|
    dataserver.vm.box = "debian/contrib-jessie64"
    dataserver.vm.provision "file", source: "./alice-xrootd-builder-docker-container/build/af-xrootd.deb", destination: "af-xrootd.deb"
    dataserver.vm.provision "file", source: "server.cf", destination: "af-xrootd/xrootd_%i.cf"
    dataserver.vm.network "private_network", ip: "192.168.1.201"
    dataserver.vm.provision :shell, :path => "boot.sh"
    dataserver.vm.provision :shell, :path => "services.sh"
	dataserver.vm.synced_folder "tmp/", "/home/vagrant/shfs"
  end

  config.vm.define "forwardproxy" do |forwardproxy|
    forwardproxy.vm.box = "debian/contrib-jessie64"
    forwardproxy.vm.provision "file", source: "./alice-xrootd-builder-docker-container/build/af-xrootd.deb", destination: "af-xrootd.deb"
    forwardproxy.vm.provision "file", source: "forwardproxy.cf", destination: "af-xrootd/xrootd_%i.cf"
    forwardproxy.vm.network "private_network", ip: "192.168.1.202"
    forwardproxy.vm.provision :shell, :path => "forwardProxy.sh"
    forwardproxy.vm.provision :shell, :path => "services.sh"
	forwardproxy.vm.synced_folder "tmp/", "/home/vagrant/shfs",mount_options:["dmode=777,fmode=777"]
  end


  config.vm.define "externalDataserver" do |externalDataserver|
    externalDataserver.vm.box = "debian/contrib-jessie64"
    externalDataserver.vm.provision "file", source: "./alice-xrootd-builder-docker-container/build/af-xrootd.deb", destination: "af-xrootd.deb"
    externalDataserver.vm.provision "file", source: "externDataserver.cf", destination: "af-xrootd/xrootd_%i.cf"
    externalDataserver.vm.network "private_network", ip: "143.100.1.200"
    externalDataserver.vm.provision :shell, :path => "externDataserver.sh"
    externalDataserver.vm.provision :shell, :path => "services.sh"

  end

  config.vm.define "client" do |client|
    client.vm.box = "debian/contrib-jessie64"
    client.vm.provision "file", source: "./alice-xrootd-builder-docker-container/build/af-xrootd.deb", destination: "af-xrootd.deb"
    client.vm.provision "file", source: "./XrdProxyDefault.conf", destination: "XrdProxyDefault.conf"
    client.vm.provision "file", source: "./proxyprefixtest.sh", destination: "proxyprefixtest.sh"
    client.vm.network "private_network", ip: "192.168.1.203"
    client.vm.provision :shell, :path => "boot.sh"
	  client.vm.synced_folder "tmp/", "/home/vagrant/shfs"
  end
end
