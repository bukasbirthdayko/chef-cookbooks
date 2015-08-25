#
# Cookbook Name:: monitis
# Recipe:: default
# Author:: 
#
# Copyright 2012, Monitis, Inc
#

if File.exists?("#{node[:MONITIS][:INSTALLDIR]}/monitis/etc/monitis.conf")
#self.msg("Monitis Agnet already installed")
execute "restart_monitis" do
   cwd "#{node[:MONITIS][:INSTALLDIR]}/monitis"
   command "./monitis.sh restart"
   action :run
end

else


package "wget" do
  action :install
end

package "tar" do
  action :install
end

package "#{node[:MONITIS][:LIBSSL]}" do
  action :install
end

arch = node[:kernel][:machine]

if "#{arch}" == "x86_64"

tarball = "#{node[:MONITIS][:TARBALL_64]}"

execute "wget" do
  tarball_url = "#{node[:MONITIS][:TARBALL_URL_64]}"
  cwd "/tmp"
  command "wget '#{tarball_url}' -O /tmp/#{tarball}"
  creates "/tmp/#{tarball}"
  action :run
end

else 

tarball = "#{node[:MONITIS][:TARBALL_32]}"

execute "wget" do
  tarball_url = "#{node[:MONITIS][:TARBALL_URL_32]}"
  cwd "/tmp"
  command "wget '#{tarball_url}' -O /tmp/#{tarball}"
  creates "/tmp/#{tarball}"
  action :run
end

end

execute "tar" do
  user "root"
  group "root"
  installation_dir = "#{node[:MONITIS][:INSTALLDIR]}"
  cwd installation_dir
  command "tar -zxf /tmp/#{tarball}"
  creates installation_dir + "/monitis"
  action :run
end

execute "remove_tarball" do
   cwd "/tmp/"
   command "rm -rf #{tarball}"
   action :run
end

template "#{node[:MONITIS][:INSTALLDIR]}/monitis/etc/monitis.conf" do
  source "monitis.conf.erb"
  mode "0755"
end

template "#{node[:MONITIS][:INSTALLDIR]}/monitis/etc/agentname.sh" do 
  source "linux-agentname.sh.erb"
  mode "0755"
end

execute "agent_name" do
   cwd "#{node[:MONITIS][:INSTALLDIR]}/monitis/etc"
   command "./agentname.sh"
   action :run
end

execute "start_monitis" do
   cwd "#{node[:MONITIS][:INSTALLDIR]}/monitis"
   command "./monitis.sh start"
   action :run
end

end

