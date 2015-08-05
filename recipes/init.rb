include_recipe 'postgresql::config_initdb'
include_recipe 'postgresql::config_pgtune'

include_recipe 'postgresql::ruby'
