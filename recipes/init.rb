#
# Cookbook Name:: postgresql-init
# Recipe:: default
#
# Copyright (c) 2015 Alexander Merkulov, All Rights Reserved.

include_recipe 'postgresql::config_initdb'
include_recipe 'postgresql::config_pgtune'

include_recipe 'postgresql::ruby'
