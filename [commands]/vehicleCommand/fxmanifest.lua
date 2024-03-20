fx_version 'cerulean'

game 'gta5'

lua54 'yes'

client_scripts {
    './client/client.lua'
}

server_scripts {
    './data/*',
    './server/server.lua',
    '@player_commands/connection.lua'
}

shared_scripts {
    './shared/*',
    '@ox_lib/init.lua',
}

