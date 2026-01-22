Config = {}

Config.Framework = 'qbox'

Config.RewardItems = {
    { name = 'tramadol_karta', count = 10 },
}

Config.kartaitems = {
    { name = 'tram_pills', count = 10 },
}

Config.EnableDrugs = true
Config.Drugs = {

    ['tram_pills'] = {
        label = 'Tramadol',
        animation = 'pill', -- Animations: blunt, sniff, pill
        time = 20, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'intenseEffect',
            'outOfBody',
            'fogEffect',
            'focusEffect',
            'drunkWalk'
        },
        cooldown = 1, -- seconds
    },
}




