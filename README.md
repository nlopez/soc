# Short Order Cook
Creates a chef-server and registers chef-client VMs using Vagrant

## Quick start

    gem install bundler --no-rdoc --no-ri
    git clone git://github.com/thalweg/soc.git
    cd soc
    ./setup.sh

## Multiple clients

Change `client_vm_count` in `Vagrantfile` and re-run `./setup.sh` to launch more than one chef-client. Be aware that each client VM will be allocated 512 MB RAM unless you change `client_config.vm.customize ["modifyvm", :id, "--memory", 512]` as well.

## Purpose
Short Order Cook lets you quickly start up a Chef server and a Chef-managed VM. This allows you to locally develop and test cookbooks, roles, and environments without losing features currently unavailable in vanilla chef-solo, such as data bag search and encrypted data bags.

## Details

`setup.sh` will move 3 files to `$HOME/.chef`:

1. knife[-soc].rb: A knife configuration file for the SOC Chef server.
2. admin-soc.pem: The private key for the admin user.
3. validation-soc.pem: The validation key for the SOC Chef server, used by `knife bootstrap`

`setup.sh` will copy over knife-soc.rb as knife.rb if none or a zero-length file exists. Use [knife-block](https://github.com/greenandsecure/knife-block) if you frequently use `knife` with multiple Chef servers!

## Recommendations
* Use [knife-block](https://github.com/greenandsecure/knife-block) to manage multiple knife.rb files for different local and remote Chef servers.
* Add `--no-rdoc --no-ri` to your `~/.gemrc` for the install and update operations to speed up `gem` and `bundler` tasks. ([source](http://stackoverflow.com/questions/1381725/how-to-make-no-ri-no-rdoc-the-default-for-gem-install/7662245#7662245))

## Thanks
* To Opscode for Chef and the [Omnibus-based Chef-Server cookbook](https://github.com/opscode-cookbooks/chef-server), on which this is based.