current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "smat"
client_key               "#{current_dir}/smat.pem"
validation_client_name   "bekk-devops-validator"
validation_key           "#{current_dir}/bekk-devops-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/bekk-devops"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
