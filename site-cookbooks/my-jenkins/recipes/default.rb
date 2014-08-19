#
# Cookbook Name:: my-jenkins
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "java"
include_recipe "yum"

yum_repository 'jenkins' do
  description "jenkins repo"
  baseurl 'http://pkg.jenkins-ci.org/redhat-stable/'
  gpgkey 'http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key'
  action :create
end

yum_package 'jenkins' do
  action :install
end

service 'jenkins' do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
