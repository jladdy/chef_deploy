#
# Cookbook:: chef_deploy
# Recipe:: default
#
# Copyright:: 2018, AddyNet Operations, All Rights Reserved.

include_recipe 'chef_deploy::nginx_config'
include_recipe 'chef_deploy::app_deploy'
