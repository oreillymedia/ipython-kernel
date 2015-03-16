#
# Barebones script to just install docker
#
$script = <<SCRIPT

sudo apt-get install -y curl
curl -sSL https://get.docker.com/ubuntu/ | sudo sh
sudo usermod -a -G docker vagrant

SCRIPT


Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/precise64"
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.network :forwarded_port, guest: 8888, host: 8888
  config.vm.provision "shell", inline: $script

end