#!/usr/bin/env bash
mkdir -p /var/lib/ohai/plugins && cp /vagrant/vagrant_eth1.rb /var/lib/ohai/plugins/vagrant_eth1.rb
mkdir -p /etc/chef && cp "/vagrant/.cache/validation.pem" "/etc/chef/validation.pem"
/usr/sbin/useradd chef --system -d /tmp -M -s /bin/false || /bin/true
bash /vagrant/chef-solo-install.sh
