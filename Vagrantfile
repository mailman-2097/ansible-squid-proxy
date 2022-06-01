# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_SRVR = "192.168.77.77"

VAGRANTFILE_API_VERSION = "2"
BOX_IMAGE = "geerlingguy/ubuntu2004"
SRVR_COND = true

$dns_script = <<SCRIPT
echo "$1	squid.local	 squid" >> /etc/hosts 
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

config.vm.define "squid", autostart: SRVR_COND	do |squid|
		squid.vm.box = BOX_IMAGE
		squid.vm.hostname = 'squid.local'
		squid.vm.network :private_network, ip: IP_SRVR
		squid.vm.network :forwarded_port, guest: 22, host: 10023, id: "ssh"
    	squid.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant"
		squid.vm.provision "shell" do |s|
			s.inline = $dns_script
			s.args = [IP_SRVR]
		end
		squid.vm.provision "shell", path: "script/setup_a.sh"
		squid.vm.provision "shell", path: "script/setup_b.sh"
		squid.vm.provision "shell", path: "script/setup_c.sh"

		squid.vm.provider :virtualbox do |vb|
					vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					vb.customize ["modifyvm", :id, "--memory", 1024]
					vb.customize ["modifyvm", :id, "--name", "squid"]
		end
end
end