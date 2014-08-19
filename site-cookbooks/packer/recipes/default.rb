#
# Cookbook Name:: packer
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "ark"

execute 'remove cracklib-packer' do
  only_if "ls -l /usr/bin/packer | grep cracklib"
  command 'rm -f /usr/bin/packer'
  action :run
end

ark 'packer' do
  url "#{node[:packer][:url_base]}/#{node[:packer][:version]}_#{node[:packer][:package]}.zip"
  checksum node[:packer][:sha256sum]
  append_env_path true
  action :put
end
