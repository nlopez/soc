require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box"

  config.vm.define :chef_server do |server_config|
    server_config.vm.host_name = "chef-server"
    server_config.vm.network :hostonly, "192.168.168.168"
    server_config.vm.customize ["modifyvm", :id, "--cpus", 2]
    server_config.vm.customize ["modifyvm", :id, "--memory", 1024]
    server_config.vm.provision :chef_solo do |chef|
      chef.json = {
        "chef-server" => {
          "version" => :latest
        }
      }
      chef.run_list = [
        "recipe[chef-server::default]"
      ]
    end
    server_config.vm.provision :shell, :inline => "cp /etc/chef-server/chef-validator.pem /vagrant/validation.pem"
  end

  config.vm.define :chef_client do |client_config|
    client_config.vm.host_name = "chef-client"
    client_config.vm.network :hostonly, "192.168.168.169"
    client_config.vm.customize ["modifyvm", :id, "--cpus", 1]
    client_config.vm.customize ["modifyvm", :id, "--memory", 512]
    client_config.vm.provision :shell, :inline => "mkdir -p /etc/chef && cp /vagrant/validation.pem $_"
    client_config.vm.provision :shell, :inline => "/usr/sbin/useradd chef --system -d /tmp -M -s /bin/false"
    client_config.vm.provision :chef_solo do |chef|
      chef.json = {
        "chef_client" => {
          "init_style" => "init",
          "server_url" => "https://192.168.168.168"
        }
      }
      chef.run_list = [
        "recipe[chef-client::delete_validation]",
        "recipe[chef-client::config]",
        "recipe[chef-client::service]"
      ]
    end
  end
end
