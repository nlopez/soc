#!/usr/bin/env bash
mkdir -p /var/lib/ohai/plugins && cp /vagrant/vagrant_eth1.rb /var/lib/ohai/plugins/vagrant_eth1.rb
mkdir -p /etc/chef && cp "/vagrant/.cache/validation.pem" "/etc/chef/validation.pem"
cp /vagrant/.cache/encrypted_data_bag_secret /etc/chef/encrypted_data_bag_secret 
/usr/sbin/useradd chef --system -d /tmp -M -s /bin/false || /bin/true
