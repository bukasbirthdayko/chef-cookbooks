name		  "avid-monitor"
maintainer        "Monitis, Inc."
maintainer_email  "info@monitis.com"
license           ""
description       "Installs and configures monitor monitoring agent"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.1"
recipe 		  "avid-monitor", "Installs and configures Monitor Agent"

%w{ ubuntu debian redhat centos fedora opensuse amazon}.each do |os|
  supports os
end

