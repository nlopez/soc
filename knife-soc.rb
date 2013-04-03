log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               "#{ENV['HOME']}/.chef/admin-soc.pem"
validation_client_name   'chef-validator'
validation_key           "#{ENV['HOME']}/.chef/validation-soc.pem"
chef_server_url          'https://192.168.168.168'
