#
# Cookbook Name:: monitis
# Recipe:: default
# Author:: 
#
# Copyright 2012, avid-monitis, Inc
#

if platform?("debian", "ubuntu", "centos", "fedora", "suse", "redhat", "amazon")
	include_recipe 'avid-monitis::linux-install'
	include_recipe 'avid-monitis::linux-addmon'
end

if platform?("windows")
	include_recipe 'avid-monitis::windows-install'
end
