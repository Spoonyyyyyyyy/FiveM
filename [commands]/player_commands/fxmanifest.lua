fx_version 'cerulean'

game 'gta5'

lua54 'yes'

client_scripts {
    'client.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
}

server_scripts {
    'server.lua',
    'connection.lua',
    '@[ox]/oxmysql/lib/MySQL.lua'
}