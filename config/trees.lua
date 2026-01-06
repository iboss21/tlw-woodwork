Config.Trees = Config.Trees or {}

-- Tree Types Definition
Config.Trees.Types = {
    ['pine'] = {
        name = 'Pine Tree',
        rarity = 'common',
        harvestTime = 12, -- seconds
        logYield = {min = 2, max = 4},
        sapChance = 20, -- percentage
        respawnTime = 1800, -- 30 minutes in seconds
        regions = {'tall_trees', 'grizzlies', 'big_valley'},
        requiredSkill = 0,
        xpReward = 10,
        model = 'p_tree_pine_01', -- RedM prop model
        health = 100
    },
    ['oak'] = {
        name = 'Oak Tree',
        rarity = 'uncommon',
        harvestTime = 18,
        logYield = {min = 3, max = 5},
        sapChance = 15,
        respawnTime = 2700, -- 45 minutes
        regions = {'heartlands', 'roanoke', 'new_hanover'},
        requiredSkill = 10,
        xpReward = 20,
        model = 'p_tree_oak_01',
        health = 150
    },
    ['cedar'] = {
        name = 'Cedar Tree',
        rarity = 'rare',
        harvestTime = 22,
        logYield = {min = 4, max = 6},
        sapChance = 40,
        respawnTime = 3600, -- 60 minutes
        regions = {'big_valley', 'ambarino', 'grizzlies'},
        requiredSkill = 25,
        xpReward = 35,
        model = 'p_tree_cedar_01',
        health = 180
    },
    ['birch'] = {
        name = 'Birch Tree',
        rarity = 'uncommon',
        harvestTime = 10,
        logYield = {min = 2, max = 3},
        sapChance = 35,
        respawnTime = 1500, -- 25 minutes
        regions = {'roanoke_ridge', 'grizzlies'},
        requiredSkill = 5,
        xpReward = 15,
        model = 'p_tree_birch_01',
        health = 120
    },
    ['redwood'] = {
        name = 'Redwood Tree',
        rarity = 'very_rare',
        harvestTime = 35,
        logYield = {min = 8, max = 12},
        sapChance = 25,
        respawnTime = 7200, -- 120 minutes
        regions = {'tall_trees_limited'},
        requiredSkill = 60,
        xpReward = 75,
        model = 'p_tree_redwood_01',
        health = 300,
        requiresTwoPlayers = true
    },
    ['maple'] = {
        name = 'Maple Tree',
        rarity = 'rare',
        harvestTime = 16,
        logYield = {min = 3, max = 5},
        sapChance = 60,
        respawnTime = 3000, -- 50 minutes
        regions = {'new_hanover', 'roanoke', 'heartlands'},
        requiredSkill = 20,
        xpReward = 30,
        model = 'p_tree_maple_01',
        health = 160
    },
    ['willow'] = {
        name = 'Willow Tree',
        rarity = 'common',
        harvestTime = 8,
        logYield = {min = 1, max = 2},
        sapChance = 10,
        respawnTime = 1200, -- 20 minutes
        regions = {'bluewater_marsh', 'bayou', 'scarlett_meadows'},
        requiredSkill = 0,
        xpReward = 8,
        model = 'p_tree_willow_01',
        health = 80
    }
}

-- Tree States
Config.Trees.States = {
    HEALTHY = 'healthy',
    MARKED = 'marked',
    FALLING = 'falling',
    FALLEN = 'fallen',
    STUMP = 'stump',
    RESPAWNING = 'respawning'
}

-- Tree Spawn Zones (Region-based coordinates)
Config.Trees.SpawnZones = {
    {
        region = 'tall_trees',
        center = vector3(-1500.0, -1800.0, 150.0),
        radius = 500.0,
        types = {'pine', 'redwood'},
        density = 0.8, -- High density
        maxTrees = 150
    },
    {
        region = 'big_valley',
        center = vector3(-1200.0, 300.0, 120.0),
        radius = 600.0,
        types = {'pine', 'cedar', 'oak'},
        density = 0.7,
        maxTrees = 200
    },
    {
        region = 'grizzlies',
        center = vector3(1200.0, 1800.0, 200.0),
        radius = 800.0,
        types = {'pine', 'cedar', 'birch'},
        density = 0.6,
        maxTrees = 180
    },
    {
        region = 'heartlands',
        center = vector3(300.0, -200.0, 90.0),
        radius = 700.0,
        types = {'oak', 'maple'},
        density = 0.5,
        maxTrees = 120
    },
    {
        region = 'roanoke',
        center = vector3(2100.0, 900.0, 110.0),
        radius = 500.0,
        types = {'oak', 'birch', 'maple'},
        density = 0.6,
        maxTrees = 140
    },
    {
        region = 'bluewater_marsh',
        center = vector3(2300.0, -500.0, 42.0),
        radius = 400.0,
        types = {'willow'},
        density = 0.9,
        maxTrees = 100
    }
}

-- Felling Mechanics
Config.Trees.Felling = {
    staminaDrainPerSwing = 2,
    damagePerSwing = 10, -- Base damage, modified by tool
    swingDuration = 1.5, -- seconds per swing
    criticalHitChance = 10, -- percentage
    criticalHitMultiplier = 1.5,
    weatherSpeedModifiers = {
        sunny = 1.0,
        cloudy = 1.0,
        rain = 0.8,
        snow = 0.7,
        fog = 0.9
    }
}

-- Falling Physics
Config.Trees.Physics = {
    fallDirection = 'player_opposite', -- 'player_opposite', 'terrain_slope', 'random'
    fallSpeed = 2.0,
    damageRadius = 3.0,
    ragdollForce = 50.0,
    soundEffect = 'tree_fall_impact',
    particleEffect = 'dust_impact'
}

-- Processing Actions
Config.Trees.Processing = {
    delimb = {
        duration = 5, -- seconds
        animation = 'delimb_tree',
        yieldItem = 'kindling',
        yieldAmount = {min = 3, max = 6},
        staminaCost = 5,
        xpReward = 5
    },
    buck = {
        duration = 8,
        animation = 'buck_tree',
        yieldItem = 'log', -- Yields specific log type based on tree
        yieldAmount = 1, -- Per cut
        maxCuts = 'based_on_tree', -- Determined by tree size
        staminaCost = 8,
        xpReward = 8
    },
    extract_sap = {
        duration = 10,
        animation = 'extract_sap',
        yieldItem = 'raw_sap',
        yieldAmount = {min = 1, max = 3},
        chance = 'based_on_tree', -- From tree config
        staminaCost = 5,
        xpReward = 10
    },
    debark = {
        duration = 6,
        animation = 'debark_tree',
        yieldItem = 'tree_bark',
        yieldAmount = {min = 2, max = 5},
        staminaCost = 4,
        xpReward = 5
    }
}

-- Multiplayer Felling
Config.Trees.MultiplayerFelling = {
    enabled = true,
    maxDistance = 5.0, -- Max distance between players
    sharedProgressMultiplier = 1.5, -- 50% faster with 2 players
    sharedXPMultiplier = 1.2, -- 20% bonus XP for both
    syncDelay = 100 -- ms
}
