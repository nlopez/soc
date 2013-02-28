#!/bin/bash
guest_cache_path="/tmp/vagrant-cache"
cp /etc/chef-server/chef-validator.pem "$guest_cache_path/validation.pem"
cp /etc/chef-server/admin.pem "$guest_cache_path/admin.pem"
