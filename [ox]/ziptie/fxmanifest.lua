fx_version 'cerulean'

game 'gta5'

lua54 'yes'

client_scripts {
    './client/cl_main.lua'
}

server_scripts {
    './server/sv_main.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
}

dependencies {
    'ox_lib',
    'ox_target',
    'ox_inventory'
}

