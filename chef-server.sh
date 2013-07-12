#!/usr/bin/env bash
cp /etc/chef-server/chef-validator.pem "/vagrant/.cache/validation.pem"
cp /etc/chef-server/admin.pem "/vagrant/.cache/admin.pem"
cp /vagrant/.cache/encrypted_data_bag_secret /etc/chef/encrypted_data_bag_secret 
