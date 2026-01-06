fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'LXR Development'
description 'LXR-Woodwork - Full-scale woodworking industry simulation'
version '1.0.0'

shared_scripts {
    'config/main.lua',
    'config/trees.lua',
    'config/materials.lua',
    'config/processing.lua',
    'config/tools.lua',
    'config/vehicles.lua',
    'config/shops.lua',
    'config/businesses.lua',
    'config/structures.lua',
    'config/skills.lua',
    'config/missions.lua',
    'config/npcs.lua',
    'config/locations.lua',
    'shared/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

files {
    'locales/*.lua',
    'html/*.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/img/*.png'
}

ui_page 'html/index.html'

lua54 'yes'

dependencies {
    'oxmysql'
}

exports {
    'GetPlayerSkill',
    'AddMaterial',
    'RemoveMaterial',
    'GetBusinessData',
    'IsPlayerEmployee',
    'GetMarketPrice',
    'SpawnTree',
    'RegisterDeliveryPoint'
}

server_exports {
    'GetPlayerSkill',
    'AddMaterial',
    'RemoveMaterial',
    'GetBusinessData',
    'IsPlayerEmployee',
    'GetMarketPrice',
    'SpawnTree',
    'RegisterDeliveryPoint'
}
