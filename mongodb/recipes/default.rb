gentoo_package_keywords "app-arch/snappy"
gentoo_package_keywords "dev-db/mongodb"

package "dev-db/mongodb" do
  action :install
end

service "mongodb" do
  action [ :enable, :start ]
  supports :status => true, :restart => true
end
