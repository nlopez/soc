# Short Order Cook
Creates a chef-server and registers chef-client VMs using Vagrant

## Quick start

    gem install bundler --no-rdoc --no-ri
    git clone git://github.com/thalweg/soc.git
    cd soc
    bundle install
    bundle exec vagrant up

Visit [the Web UI](https://192.168.168.168) and login with the default admin credentials to create a Chef API user for use with knife.

Change `client_vm_count` in `Vagrantfile` to launch more than 1 chef-client.

## Purpose
Short Order Cook lets you quickly start up a Chef server and a Chef-managed VM. This allows you to locally develop and test cookbooks, roles, and environments without losing features currently unavailable in vanilla chef-solo, such as data bag search and encrypted data bags.

## Recommendations
* Use [knife-block](https://github.com/greenandsecure/knife-block) to manage multiple knife.rb files for different local and remote Chef servers.
* Add `--no-rdoc --no-ri` to your `~/.gemrc` for the install and update operations to speed up `gem` and `bundler` tasks. ([source](http://stackoverflow.com/questions/1381725/how-to-make-no-ri-no-rdoc-the-default-for-gem-install/7662245#7662245))

## Thanks
* To Opscode for Chef and the [Omnibus-based Chef-Server cookbook](https://github.com/opscode-cookbooks/chef-server), on which this is based.