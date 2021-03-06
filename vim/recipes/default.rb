include_recipe "gentoo::portage"

unless node[:gentoo][:use_flags].include?("vim-syntax")
  node.default[:gentoo][:use_flags] << "vim-syntax"
  generate_make_conf "added vim-syntax USE flag"
end

gentoo_package "app-editors/vim" do
  action :install
  use "vim-pager"
end
