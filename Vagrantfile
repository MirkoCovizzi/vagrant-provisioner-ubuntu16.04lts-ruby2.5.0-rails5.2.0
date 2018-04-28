Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |vb|
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
  end

  config.vm.provision :shell, path: "bootstrap.sh", keep_color: true, privileged: false
  config.vm.network "forwarded_port", guest: 3000, host: 3000
end
