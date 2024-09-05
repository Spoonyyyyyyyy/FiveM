resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script "NativeUI.lua"

client_scripts { 
	'@ag_framework/initialise/cInit.lua',
	'@ag_framework/locale.lua',

	"client/config.lua",
	"client/hud.lua",
	"client/notification.lua",
	"client/skillbar.lua",
	"client/racing.lua",
}

server_scripts {
	'@ag_framework/shared/async.lua',
	'@ag_framework/database/lib/mysql.lua',
	'@ag_framework/locale.lua',
}

ui_page "public/index.html"

files {
	"build/build.js",

	"public/index.html",
	"public/img/*.svg",
	"public/img/*.png",
	"build/img/*",
	"public/*.css",
	"public/*.js",

	"postals.json",
}

postal_file("postals.json")

exports {
	"getPlayerDirection",
	"getPlayerLocation",
	"getCoordsLocation",
	"skillbar"
}
