#
# Cookbook Name:: monitis
# Attributes:: default
#
# Author:: 
#
# Copyright 2012, Monitis, Inc.


# default attributes for all platforms
default['MONITIS']['INSTALLDIR'] = "/opt/"
default['MONITIS']['USEREMAIL'] = "EMAIL"
default['MONITIS']['PASSWORD'] = "PASSWORD"


default['MONITIS']['AGENTNAME'] = node[:hostname]
default['MONITIS']['TARBALL_32'] = "monitis-agent-linux-32bit.tar.gz"
default['MONITIS']['TARBALL_64'] = "monitis-agent-linux-64bit.tar.gz"
default['MONITIS']['TARBALL_URL_32'] = "https://dashboard.monitis.com/downloader/monitis-agent-linux-32bit.tar.gz"
default['MONITIS']['TARBALL_URL_64'] = "https://dashboard.monitis.com/downloader/monitis-agent-linux-64bit.tar.gz"

# overrides on a platform-by-platform basis
case platform
when "debian","ubuntu"

default['MONITIS']['LIBSSL'] = "openssl"

when "redhat","centos","fedora","amazon"
default['MONITIS']['LIBSSL'] = "openssl-devel"

when "suse"

default['MONITIS']['LIBSSL'] = "libopenssl1_0_0"

when "windows"

default['MONITIS']['TEMP'] = ENV['temp']
default['MONITIS']['TARBALL'] = "monitis-agent-win-64bit.zip"
default['MONITIS']['TARBALL_URL'] = "https://dashboard.monitis.com/downloader/monitis-agent-win-64bit.zip"

end
