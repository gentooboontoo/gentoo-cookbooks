package "dev-db/redis" do
  action :install
end

service "redis" do
  action [ :enable, :start ]
  supports :status => true, :restart => true
end

