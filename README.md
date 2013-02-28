# Short Order Cook
Bootstrap a chef-server and chef-client instance using Vagrant.

## Quick start

    gem install bundler --no-rdoc --no-ri
    bundle install
    bundle exec vagrant up

Visit [https://192.168.168.168](https://192.168.168.168) in your web browser and login with the default admin credentials to create a Chef API user for use with knife.

See [Node chef-client](https://192.168.168.168/nodes/chef-client) for the node registered by this Vagrantfile!

## Recommendations
Use [knife-block](https://github.com/greenandsecure/knife-block) to manage multiple knife.rb files for different local and remote Chef servers.

## Thanks
To Opscode for Chef and the [Omnibus-based Chef-Server cookbook](https://github.com/opscode-cookbooks/chef-server), on which this is based.