games {'gta5'}

fx_version 'cerulean'

lua54 'yes'

client_scripts {
  './client/*',
}

server_scripts {
  './server/*',
  '@oxmysql/lib/MySQL.lua',
}

shared_scripts {
  './shared/config.lua',
  '@ox_lib/init.lua',
}