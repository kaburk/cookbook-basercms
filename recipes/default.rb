#
# Cookbook Name:: basercms
# Recipe:: default
#
# Copyright 2014, The Independent Rhythm
#
# All rights reserved - Do Not Redistribute
#

#
# install unzip package
#
package "unzip" do
	action :install
end


#
# install BaserCMS
#
root_file = "#{node['basercms']['install_path']}/index.php"
remote_file "basercms" do
	source node["basercms"]["download_link"]
	path "#{Chef::Config[:file_cache_path]}/basercms.zip"
	owner "root"
	group "root"
	mode 0644
	action :create
	not_if { File.exists?(root_file) }
end

template "basercms" do
	source "install.sh.erb"
	path "#{Chef::Config[:file_cache_path]}/install.sh"
	owner "root"
	group "root"
	mode 0755
	not_if { File.exists?(root_file) }
end

bash "basercms" do
	code "#{Chef::Config[:file_cache_path]}/install.sh"
	action :run
	not_if { File.exists?(root_file) }
end

#
# create database
#
db_password = node["basercms"]["db"]["password"]
db_name     = node["basercms"]["db"]["name"]
template "create_database" do
	source "create_database.sql.erb"
	path "#{Chef::Config[:file_cache_path]}/create_database.sql"
	owner "root"
	group "root"
	mode 0644
	not_if "mysql -u root -p#{db_password} -D #{db_name}"
end

execute "create_database" do
	command "mysql -u root -p#{db_password} < #{Chef::Config[:file_cache_path]}/create_database.sql"
	not_if "mysql -u root -p#{db_password} -D #{db_name}"
end
