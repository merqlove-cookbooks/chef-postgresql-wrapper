default['postgresql']['pgdg']['repo_rpm_url']['9.4']['centos'] = {
  "7" => {
    "x86_64" => "http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm"
  },
  "6" => {
    "i386" => "http://yum.postgresql.org/9.4/redhat/rhel-6-i386/pgdg-centos94-9.4-1.noarch.rpm",
    "x86_64" => "http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-1.noarch.rpm"
  },
  "5" => {
    "i386" => "http://yum.postgresql.org/9.4/redhat/rhel-5-i386/pgdg-centos94-9.4-1.noarch.rpm",
    "x86_64" => "http://yum.postgresql.org/9.4/redhat/rhel-5-x86_64/pgdg-centos94-9.4-1.noarch.rpm"
  }
}

case node['platform_family']
when 'debian', 'ubuntu'
  default['postgresql']['enable_pgdg_apt'] = true
when 'rhel', 'fedora', 'suse'
  default['postgresql']['enable_pgdg_yum'] = true
end

