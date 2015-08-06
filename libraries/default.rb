#
# Cookbook Name:: postgresql-wrapper
# Library:: default
# Author:: David Crane (<davidc@donorschoose.org>)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include Chef::Mixin::ShellOut

module Opscode
  module PostgresqlHelpers
    module ClassMethods

######################################
# Function to build information needed to install RPM for PGDG yum repository,
# since PGDG supports several versions of PostgreSQL, platforms, platform versions
# and architectures.
# Links to RPMs for installation are in an attribute so that new versions/platforms
# can be more easily added. (See attributes/default.rb)
def pgdgrepo_rpm_info
  repo_rpm_url = node['postgresql']['pgdg']['repo_rpm_url'].
    fetch(node['postgresql']['version']).            # e.g., fetch for "9.1"
    fetch(node['platform']).                         # e.g., fetch for "centos"
    fetch(node['platform_version'].to_f.to_i.to_s).  # e.g., fetch for "5" (truncated "5.7")
    fetch(node['kernel']['machine'] =~ /x86_64/ ? "x86_64" : "i386") # e.g., fetch for "i386" or "x86_64"

  # Extract the filename portion from the URL for the PGDG repository RPM.
  # E.g., repo_rpm_filename = "pgdg-centos92-9.2-6.noarch.rpm"
  repo_rpm_filename = File.basename(repo_rpm_url)

  # Extract the package name from the URL for the PGDG repository RPM.
  # E.g., repo_rpm_package = "pgdg-centos92"
  repo_rpm_package = repo_rpm_filename.split(/-/,3)[0..1].join('-')

  return [ repo_rpm_url, repo_rpm_filename, repo_rpm_package ]
end

    end
  end
end
