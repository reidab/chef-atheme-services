#
# Cookbook Name:: atheme-services
# Recipe:: default
#

package 'gettext'

user node['atheme-services']['user']

ark 'atheme-services' do
  url node['atheme-services']['url']
  checksum node['atheme-services']['checksum']
  version node['atheme-services']['version']
  prefix_root '/usr/local/src'
  autoconf_opts [
    '--enable-fhs-paths',
    '--prefix=/usr/local',
    '--sysconfdir=/etc/atheme',
    '--localstatedir=/var'
  ]

  action :install_with_make
end

template "/etc/atheme/atheme.conf" do
  source "atheme.conf.erb"
  owner "root"
  group "root"
end

%w(log lib run).each do |dir|
  directory "/var/#{dir}/atheme" do
    owner node['atheme-services']['user']
    owner node['atheme-services']['group']
    recursive true
  end
end

template "/etc/init/atheme-services.conf" do
  source "atheme-upstart.conf.erb"
  owner "root"
  group "root"
end

service "atheme-services" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
