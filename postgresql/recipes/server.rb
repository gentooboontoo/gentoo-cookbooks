package "dev-db/postgresql-server" do
  action :install
end

slot = node[:postgresql][:gentoo_slot]

template "/etc/conf.d/postgresql-#{slot}" do
  source "postgresql.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  variables(
    :initdb_opts => node[:postgresql][:initdb_options]
  )
end

execute "yes | emerge --config dev-db/postgresql-server" do
  creates "/var/lib/postgresql/#{slot}/data"
end

service "postgresql-#{slot}" do
  action [ :enable, :start ]
  supports :status => true, :restart => true, :reload => true
end
