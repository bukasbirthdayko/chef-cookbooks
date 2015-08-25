#
# Cookbook Name:: monitor
# Recipe:: default
# Author:: 
#
# Copyright 2012, avid-monitor, Inc
#

if platform?("debian", "ubuntu", "centos", "fedora", "suse", "redhat", "amazon")
	include_recipe 'avid-monitor::linux-install'
	include_recipe 'avid-monitor::linux-addmon'
end

if platform?("windows")
	include_recipe 'avid-monitor::windows-install'
end
