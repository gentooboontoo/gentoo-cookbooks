default[:gentoo][:arch] = case node[:kernel][:machine]
  when "x86_64"
    "amd64"
  else
    node[:kernel][:machine]
  end

default[:gentoo][:profile] = "default/linux/#{node[:gentoo][:arch]}/13.0"

default[:gentoo][:use_flags] = []

default[:gentoo][:cflags] = ["-march=native", "-O2", "-pipe"]
default[:gentoo][:makeopts] = "-j#{node[:cpu][:total].to_i+1}"

default[:gentoo][:portage_features] = %w(strict buildpkg)
default[:gentoo][:emerge_options] = ["--verbose"] # + ["--jobs=3", "--load-average=3"]
default[:gentoo][:overlay_directories] = []
default[:gentoo][:collision_ignores] = []
default[:gentoo][:accept_licenses] = []
default[:gentoo][:ruby_targets] = ["ruby18"]
default[:gentoo][:use_expands] = {}
default[:gentoo][:elog_mailuri] = "" # "foo@example.com smtp.example.com"
default[:gentoo][:elog_mailfrom] = "portage@#{node[:fqdn]}"
default[:gentoo][:rsync_mirror] = "rsync://rsync.gentoo.org/gentoo-portage"
default[:gentoo][:distfile_mirrors] = []
default[:gentoo][:portage_binhost] = ""

default[:gentoo][:hwtimezone] = "UTC" # "local"
default[:gentoo][:timezone] = "UTC" # "Europe/Budapest"
default[:gentoo][:synchwclock] = true # false

default[:gentoo][:locales] = ["en_US.UTF-8 UTF-8"]
default[:gentoo][:lang] = "en_US.UTF-8"

default[:gentoo][:sysctl] = {
  "kernel.panic" => 60,
  "kernel.shmmax" => 83886080,
  "net.ipv4.conf.all.rp_filter" => 1,
  "net.ipv4.conf.default.accept_redirects" => 0,
  "net.ipv4.conf.default.accept_source_route" => 0,
  "net.ipv4.conf.default.log_martians" => 1,
  "net.ipv4.conf.default.rp_filter" => 1,
  "net.ipv4.icmp_echo_ignore_broadcasts" => 1,
  "net.ipv4.icmp_ignore_bogus_error_responses" => 1,
}
