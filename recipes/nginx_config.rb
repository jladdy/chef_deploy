#
# Cookbook:: chef_deploy
# Recipe:: nginx_config
#
# Copyright:: 2018, AddyNet Operations, All Rights Reserved.

# Create and enable Virtaul Host for example site
template "/etc/nginx/sites-available/example" do
  source "example_vhost.erb"
  action :create
end

link '/etc/nginx/sites-enabled/example' do
  to '/etc/nginx/sites-available/example'
end

# Retrieve other node IP addresses from Chef Server and store for health check

servers = search(:node, "role:test_app NOT name:#{node.name}")

template "/tmp/nodes" do
  source "node_list.erb"
  variables(:servers => servers)
end

# Copy health check script to /tmp/

cookbook_file '/tmp/check.sh' do
  source 'check.sh'
  action :create
end

# Check if other nodes are online and responding to requests

execute 'check_nodes' do
  command '/bin/bash /tmp/check.sh'
end
