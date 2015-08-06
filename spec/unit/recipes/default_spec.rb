#
# Cookbook Name:: nginx-wrapper
# Spec:: default
#
# Copyright (c) 2015 Alexander Merkulov, All Rights Reserved.

require 'spec_helper'

describe 'postgresql-wrapper::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.default['postgresql']['version'] = '9.4'

        node.default['postgresql']['config']['data_directory'] = node['postgresql']['dir']
        node.default['postgresql']['config']['listen_addresses'] = 'localhost'
        node.default['postgresql']['config']['port'] = 5432
        node.default['postgresql']['config']['max_connections'] = 100
        node.default['postgresql']['config']['shared_buffers'] = '32MB'
        node.default['postgresql']['config']['logging_collector'] = true
        node.default['postgresql']['config']['log_directory'] = 'pg_log'
        node.default['postgresql']['config']['log_filename'] = 'postgresql-%a.log'
        node.default['postgresql']['config']['log_truncate_on_rotation'] = true
        node.default['postgresql']['config']['log_rotation_age'] = '1d'
        node.default['postgresql']['config']['log_rotation_size'] = 0
        node.default['postgresql']['config']['datestyle'] = 'iso, mdy'
        node.default['postgresql']['config']['lc_messages'] = 'en_US.UTF-8'
        node.default['postgresql']['config']['lc_monetary'] = 'en_US.UTF-8'
        node.default['postgresql']['config']['lc_numeric'] = 'en_US.UTF-8'
        node.default['postgresql']['config']['lc_time'] = 'en_US.UTF-8'
        node.default['postgresql']['config']['default_text_search_config'] = 'pg_catalog.english'

        node.automatic['ipaddress'] = '500.500.500.500' # Intentionally not a real IP
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      stub_command('ls /recovery.conf')
      chef_run
    end

    it 'has attributes' do
      stub_command('ls /recovery.conf')
      expect(chef_run).to install_package('postgresql')
    end
  end
end
