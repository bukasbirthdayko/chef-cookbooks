
template 'opt/monitis/etc/addmonitor-linux.sh' do
  source 'addmonitor-linux.sh.erb'
end

script "add_monitors" do
  interpreter "bash"
  user "root"
  cwd "/opt/monitis/etc"
  code <<-EOH
  sudo chmod +x addmonitor-linux.sh
  sudo ./addmonitor-linux.sh
  EOH
end

