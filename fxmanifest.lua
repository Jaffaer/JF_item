fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'FM-JF'
description 'item opening'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua',
    'client/cl_using.lua'
}

server_scripts {
    'server/server.lua',
    'server/sv_usableitems.lua'
}

files {
    'stream/drog@box_anim.ycd',
    'stream/karta.ytyp',
    'stream/paket.ytyp',
    'stream/lyrica.ytyp',
    'stream/ballong.ytyp',
    'stream/lsd.ytyp'
    
}

data_file 'ANIM_DICT' 'stream/drog@box_anim.ycd'
data_file 'DLC_ITYP_REQUEST' 'stream/karta.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/paket.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/lsd.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/lyrica.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ballong.ytyp'



dependency '/assetpacks'