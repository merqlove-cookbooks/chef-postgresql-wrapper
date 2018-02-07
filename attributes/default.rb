default['postgresql']['pgdg']['repo_rpm_url']['9.3']['centos'] ||= {} 
default['postgresql']['pgdg']['repo_rpm_url']['9.3']['centos'] = node['postgresql']['pgdg']['repo_rpm_url']['9.3']['centos'].merge({
  "6" => {
    "i386" => "http://yum.postgresql.org/9.3/redhat/rhel-6-i386/pgdg-centos93-9.3-3.noarch.rpm",
    "x86_64" => "http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-3.noarch.rpm"
  }
})

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

default['postgresql']['pgdg']['repo_rpm_url']['9.6']['centos'] = {
  "7" => {
    "x86_64" => "http://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm"
  },
  "6" => {
    "i386" => "http://yum.postgresql.org/9.6/redhat/rhel-6-i386/pgdg-centos96-9.6-3.noarch.rpm",
    "x86_64" => "http://yum.postgresql.org/9.6/redhat/rhel-6-x86_64/pgdg-centos96-9.6-3.noarch.rpm"
  }
}

default['postgresql']['pgdg']['repo_rpm_url']['10']['centos'] = {
  "7" => {
    "x86_64" => "http://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-1.noarch.rpm"
  },
  "6" => {
    "i386" => "http://yum.postgresql.org/10/redhat/rhel-6-i386/pgdg-centos10-10-1.noarch.rpm",
    "x86_64" => "http://yum.postgresql.org/10/redhat/rhel-6-x86_64/pgdg-centos10-10-1.noarch.rpm"
  }
}

case node['platform_family']
when 'debian', 'ubuntu'
  default['postgresql']['enable_pgdg_apt'] = true
when 'rhel', 'fedora', 'suse'
  default['postgresql']['enable_pgdg_yum'] = true
end
