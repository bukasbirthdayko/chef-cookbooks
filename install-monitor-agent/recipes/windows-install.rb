
arch = node[:kernel][:machine]
tarball = "#{node[:MONITIS][:TARBALL]}"
tarball_url = "#{node[:MONITIS][:TARBALL_URL]}"
dst = "#{node[:MONITIS][:TEMP]}/#{tarball}"
exe = "#{node[:MONITIS][:TEMP]}/MonitisAgentSetup.exe"

if "#{arch}" == "x86_64"

INSTALLDIR = ENV['ProgramFiles(x86)']

if File.exists?("#{INSTALLDIR}\\Monitis.com\\Monitis\\Controller.exe")

else


remote_file "#{dst}" do
  source "#{tarball_url}"
end

monitis_zipfile dst do
  path "#{node[:MONITIS][:TEMP]}"
  source "#{dst}"
  action :unzip
end

execute "install #{exe}" do
  command "#{exe} /S"
end

monitis_registry 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Monitis.com\Monitis\Agent' do
  values 'E-Mail' => node[:MONITIS][:USEREMAIL]
end

monitis_registry 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Monitis.com\Monitis\Agent' do
  values 'Password' => node[:MONITIS][:PASSWORD]
end

execute "remove_tarball" do
   cwd "#{node[:MONITIS][:TEMP]}"
   command "rm -f #{dst}"
   action :run
end

execute "remove_exe" do
   cwd "#{node[:MONITIS][:TEMP]}"
   command "rm -f #{exe}"
   action :run
end

execute "remove_registry" do
   cwd "#{node[:MONITIS][:TEMP]}"
   command "rm -f agent.reg"
   action :run
end

execute "sleep_5" do
  command "ping -n 10 localhost> nul"
end

execute "kill_process" do
  command 'taskkill /F /IM controller.exe'
end

execute "stop_service" do
  command 'net stop "Monitis Smart Agent" /y'
end

execute "start_service" do
  command 'net start "Monitis Smart Agent" /y'
end


end

else
INSTALLDIR = ENV['ProgramFiles']

if File.exists?("#{INSTALLDIR}\\Monitis.com\\Monitis\\Controller.exe")

else

remote_file "#{dst}" do
  source "#{tarball_url}"
end

monitis_zipfile dst do
  path "#{node[:MONITIS][:TEMP]}"
  source "#{dst}"
  action :unzip
end

execute "install #{exe}" do
  command "#{exe} /S"
end

monitis_registry 'HKEY_LOCAL_MACHINE\SOFTWARE\Monitis.com\Monitis\Agent' do
  values 'E-Mail' => node[:MONITIS][:USEREMAIL]
end

monitis_registry 'HKEY_LOCAL_MACHINE\SOFTWARE\Monitis.com\Monitis\Agent' do
  values 'Password' => node[:MONITIS][:PASSWORD]
end

execute "remove_tarball" do
   cwd "#{node[:MONITIS][:TEMP]}"
   command "rm -f #{dst}"
   action :run
end

execute "remove_exe" do
   cwd "#{node[:MONITIS][:TEMP]}"
   command "rm -f #{exe}"
   action :run
end

execute "remove_registry" do
   cwd "#{node[:MONITIS][:TEMP]}"
   command "rm -f agent.reg"
   action :run
end

execute "sleep_5" do
  command "ping -n 10 localhost> nul"
end

execute "kill_process" do
  command 'taskkill /F /IM controller.exe'
end

execute "stop_service" do
  command 'net stop "Monitis Smart Agent" /y'
end

execute "start_service" do
  command 'net start "Monitis Smart Agent" /y'
end


end
end


