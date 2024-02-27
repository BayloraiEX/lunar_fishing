Config = {}

Config.progressPerCatch = 0.05 -- The progress per one fish caught

---@class Fish
---@field price integer | { min: integer, max: integer }
---@field chance integer Percentage chance
---@field skillcheck SkillCheckDifficulity }

---@type table<string, Fish>
Config.fish = {
    ['anchovy'] = { price = { min = 10, max = 20 }, chance = 35, skillcheck = { 'easy', 'easy' } }, -- Ocean
    ['fish'] = { price = { min = 15, max = 40 }, chance = 35, skillcheck = { 'easy', 'easy' } }, -- River
    ['redfish'] = { price = { min = 15, max = 40 }, chance = 35, skillcheck = { 'easy', 'easy' } }, -- River
    ['goldfish'] = { price = { min = 15, max = 40 }, chance = 35, skillcheck = { 'easy', 'easy' } }, -- River
    ['salmon'] = { price = { min = 20, max = 50 }, chance = 25, skillcheck = { 'easy', 'easy', 'medium' } }, -- Ocean & River
    ['pinksalmon'] = { price = { min = 20, max = 50 }, chance = 20, skillcheck = { 'easy', 'easy', 'medium' } }, -- Ocean & River
    ['trout'] = { price = { min = 20, max = 50 }, chance = 20, skillcheck = { 'easy', 'medium', 'medium' } }, -- Ocean & River
    ['tuna'] = { price = { min = 20, max = 50 }, chance = 20, skillcheck = { 'easy', 'medium', 'medium' } }, -- Ocean & River
    ['stripedbass'] = { price = { min = 30, max = 60 }, chance = 10, skillcheck = { 'easy', 'medium', 'hard' } }, -- River
    ['largemouthbass'] = { price = { min = 40, max = 70 }, chance = 10, skillcheck = { 'easy', 'medium', 'hard' } }, -- River
    ['catfish'] = { price = { min = 50, max = 80 }, chance = 5, skillcheck = { 'easy', 'medium', 'hard' } }, -- Ocean
    ['stingray'] = { price = { min = 60, max = 125 }, chance = 5, skillcheck = { 'easy', 'medium', 'hard' } }, -- Ocean
    ['haddock'] = { price = { min = 60, max = 125 }, chance = 20, skillcheck = { 'easy', 'medium' } }, -- Ocean
    ['grouper'] = { price = { min = 60, max = 125 }, chance = 25, skillcheck = { 'easy', 'medium', 'medium', 'medium' } }, -- Ocean
    ['piranha'] = { price = { min = 30, max = 60 }, chance = 25, skillcheck = { 'easy', 'medium', 'hard' } }, -- Swamp
    ['red_snapper'] = { price = { min = 60, max = 125 }, chance = 20, skillcheck = { 'easy', 'medium', 'medium', 'medium' } },
    ['mahi_mahi'] = { price = { min = 60, max = 125 }, chance = 20, skillcheck = { 'easy', 'medium', 'medium', 'medium' } },
    ['whale'] = { price = { min = 100, max = 160 }, chance = 5, skillcheck = { 'easy', 'medium', 'hard' } }, -- Deep Ocean
    ['bluewhale'] = { price = { min = 100, max = 170 }, chance = 5, skillcheck = { 'easy', 'medium', 'hard' } }, -- Deep Ocean
    ['shark'] = { price = { min = 150, max = 300 }, chance = 2, skillcheck = { 'medium', 'medium', 'hard' } }, -- Deep Ocean
    ['oldtreasurechest'] = { price = { min = 500, max = 1000 }, chance = 1, skillcheck = { 'medium', 'medium', 'medium' }}, -- SPECIAL ITEM WORTH $$$
}

---@class FishingRod
---@field name string
---@field price integer
---@field minLevel integer The minimal level
---@field breakChance integer Percentage chance

---@type FishingRod[]
Config.fishingRods = {
    { name = 'fishingrod', price = 200, minLevel = 1, breakChance = 20 },
    { name = 'basic_rod', price = 100, minLevel = 5, breakChance = 15 },
    { name = 'graphite_rod', price = 300, minLevel = 10, breakChance = 10 },
    { name = 'titanium_rod', price = 500, minLevel = 20, breakChance = 0 },
}

---@class FishingBait
---@field name string
---@field price integer
---@field minLevel integer The minimal level
---@field waitDivisor number The total wait time gets divided by this value

---@type FishingBait[]
Config.baits = {
    { name = 'worms', price = 1, minLevel = 1, waitDivisor = 1.0 },
    { name = 'fishbait', price = 2, minLevel = 5, waitDivisor = 2.0 },
    { name = 'artificial_bait', price = 3, minLevel = 10, waitDivisor = 3.0 },
}

---@class FishingZone
---@field locations vector3[] One of these gets picked at random
---@field radius number
---@field minLevel integer
---@field waitTime { min: integer, max: integer }
---@field includeOutside boolean Whether you can also catch fish from Config.outside
---@field blip BlipData?
---@field message { enter: string, exit: string }?
---@field fishList string[]

---@type FishingZone[]
Config.fishingZones = {
    {
        blip = {
            name = 'Coral Reef',
            sprite = 405,
            color = 18,
            scale = 0.6
        },
        locations = {
            vector3(-1774.0654, -1796.2740, 0.0),
            vector3(2482.8589, -2575.6780, 0.0)
        },
        radius = 250.0,
        minLevel = 1,
        waitTime = { min = 5, max = 10 },
        includeOutside = false,
        message = { enter = 'You have entered a coral reef.', exit = 'You have left the coral reef.' },
        fishList = { 'anchovy', 'salmon', 'pinksalmon', 'trout', 'tuna', 'mahi_mahi', 'red_snapper' }
    },
    {
        blip = {
            name = 'Deep Waters',
            sprite = 405,
            color = 29,
            scale = 0.6
        },
        locations = {
            vector3(-4941.7964, -2411.9146, 0.0),
        },
        radius = 1000.0,
        minLevel = 10,
        waitTime = { min = 20, max = 40 },
        includeOutside = false,
        message = { enter = 'You have entered deep waters.', exit = 'You have left deep waters.' },
        fishList = { 'salmon', 'pinksalmon', 'trout', 'tuna', 'haddock', 'grouper', 'catfish', 'stingray', 'whale', 'bluewhale', 'shark' }
    },
    {
        blip = {
            name = 'Swamp',
            sprite = 405,
            color = 24,
            scale = 0.6
        },
        locations = {
            vector3(-2188.1182, 2596.9348, 0.0),
        },
        radius = 200.0,
        minLevel = 3,
        waitTime = { min = 10, max = 20 },
        includeOutside = false,
        message = { enter = 'You have entered a swamp.', exit = 'You have left the swamp.' },
        fishList = { 'piranha', 'largemouthbass' }
    },
    {
        blip = {
            name = 'River',
            sprite = 405,
            color = 26,
            scale = 0.6
        },
        locations = {
            vector3(-618.84, 4427.46, 0.0),
            vector3(-178.21, 3063.3, 0.0),
            vector3(-1526.51, 1505.36, 0.0),
        },
        radius = 125.0,
        minLevel = 2,
        waitTime = { min = 5, max = 10 },
        includeOutside = false,
        message = { enter = 'You have entered a river.', exit = 'You have left the river.' },
        fishList = { 'fish', 'redfish', 'goldfish', 'salmon', 'pinksalmon', 'trout', 'tuna', 'stripedbass', 'largemouthbass' }
    },
}

-- Outside of all zones
Config.outside = {
    waitTime = { min = 10, max = 25 },

    ---@type string[]
    fishList = {
        'anchovy', 'fish', 'redfish', 'goldfish', 'salmon'
    }
}

Config.ped = {
    model = `s_m_m_cntrybar_01`,
    buyAccount = 'money',
    sellAccount = 'money',
    blip = {
        name = 'SeaTrade Corporation',
        sprite = 405,
        color = 18,
        scale = 0.5
    },

    ---@type vector4[]
    locations = {
        vector4(-2081.3831, 2614.3223, 3.0840, 112.7910),
        vector4(-1492.3639, -939.2579, 10.2140, 144.0305)
    }
}

Config.renting = {
    model = `s_m_m_dockwork_01`, -- The ped model
    account = 'money',
    boats = {
        { model = `speeder`, price = 250, image = 'https://i.postimg.cc/mDSqWj4P/164px-Speeder.webp' },
        { model = `dinghy`, price = 500, image = 'https://i.postimg.cc/ZKzjZgj0/164px-Dinghy2.webp'  },
        { model = `tug`, price = 750, image = 'https://i.postimg.cc/jq7vpKHG/164px-Tug.webp' }
    },
    blip = {
        name = 'Boat Rental',
        sprite = 405,
        color = 74,
        scale = 0.5
    },

    ---@type { coords: vector4, spawn: vector4 }[]
    locations = {
        { coords = vector4(-1434.4818, -1512.2745, 2.1486, 25.8666), spawn = vector4(-1494.4496, -1537.6943, 2.3942, 115.6015) }
    }
}
