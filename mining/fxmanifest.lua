games {'gta5'}

fx_version 'cerulean'


client_scripts {
  './client/*',
}

server_scripts {
  './server/*',
  '@oxmysql/lib/MySQL.lua',
}

shared_scripts {
  './shared/config.lua'
}