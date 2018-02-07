#
# Cookbook Name:: postgresql-init
# Recipe:: default
#
# Copyright (c) 2015 Alexander Merkulov, All Rights Reserved.

include_recipe 'postgresql::config_initdb'
include_recipe 'postgresql::config_pgtune'

if node['postgresql']['version'].to_f >= 9.6  
  max_val_size = (3 * node['postgresql']['config']['checkpoint_segments'].to_i) * 16
  node.default['postgresql']['config']['max_wal_size'] = "#{max_val_size}MB"
  node.default['postgresql']['config']['checkpoint_segments'] = nil
end

include_recipe 'postgresql::ruby'
