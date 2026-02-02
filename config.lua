Config = {}

Config.Framework = 'qbox'
-- lsd
Config.lsditems = {
    { name = 'lsd_tabs', count = 10 },
}
-- tram låda
Config.tramboxitems = {
    { name = 'tramadol_karta', count = 10 },
}
Config.kartaitems = {
    { name = 'tram_pills', count = 10 },
}
-- lyrica 
Config.lyricaboxitems = {
    { name = 'lyrica_karta', count = 10 },
}
Config.kartalyricaitems = {
    { name = 'lyrica_pills', count = 10 },
}




Config.EnableDrugs = true
Config.Drugs = {

    ['tram_pills'] = {
        label = 'Tramadol',
        animation = 'pill', -- Animations: blunt, sniff, pill
        time = 20, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'intenseEffect',
            'confusionEffect',
            'fogEffect',
            'focusEffect',
            'drunkWalk'
        },
        cooldown = 1, -- seconds
    },
    ['lsd_tabs'] = {
        label = 'LSD',
        animation = 'pill', -- Animations: blunt, sniff, pill
        time = 20, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'intenseEffect',
            'confusionEffect',
            'fogEffect',
            'focusEffect',
            'drunkWalk'
        },
        cooldown = 1, -- seconds
    },
    ['lyrica_pills'] = {
        label = 'LSD',
        animation = 'pill', -- Animations: blunt, sniff, pill
        time = 20, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'intenseEffect',
            'confusionEffect',
            'fogEffect',
            'focusEffect',
            'drunkWalk'
        },
        cooldown = 1, -- seconds
    },
}




