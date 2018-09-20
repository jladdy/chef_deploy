#
# Cookbook:: chef_deploy
# Recipe:: app_deploy
#
# Copyright:: 2018, AddyNet Operations, All Rights Reserved.

directory '/srv/example' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

git '/srv/example' do
  repository 'git://github.com/jladdy/example_app.git'
  revision 'master'
  action :sync
end
