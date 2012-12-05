execute "eix-update" do
  command "/usr/bin/eix-update"
  action :nothing
end

package "app-portage/eix" do
  action :upgrade
  notifies :run, "execute[eix-update]", :immediately
end
