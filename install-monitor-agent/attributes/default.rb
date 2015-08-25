#
# Cookbook Name:: monitis
# Attributes:: default
#
# Author:: 
#
# Copyright 2012, Monitis, Inc.


# default attributes for all platforms
default['MONITIS']['INSTALLDIR'] = "/tmp/"
default['MONITIS']['USEREMAIL'] = "EMAIL"
default['MONITIS']['PASSWORD'] = "MD5PASSWORD"
default['MONITIS']['APIKEY'] = "APIKEY"
default['MONITIS']['SECRET'] = "SECRETKEY"

default['MONITIS']['AGENTNAME'] = node[:hostname]
default['MONITIS']['TARBALL_32'] = "monitorus-agent-linux-32bit.tar.gz"
default['MONITIS']['TARBALL_64'] = "monitorus-agent-linux-64bit.tar.gz"
default['MONITIS']['TARBALL_URL_32'] = "https://dashboard.monitor.us/downloader/monitorus-agent-linux-32bit.tar.gz"
default['MONITIS']['TARBALL_URL_64'] = "https://dashboard.monitor.us/downloader/monitorus-agent-linux-64bit.tar.gz"

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
default['MONITIS']['TARBALL'] = "monitorus-agent-win-64bit.zip"
default['MONITIS']['TARBALL_URL'] = "https://dashboard.monitor.us/downloader/monitorus-agent-win-64bit.zip"

end
