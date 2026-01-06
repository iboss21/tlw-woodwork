Config.Missions = Config.Missions or {}

-- Contract Types
Config.Missions.ContractTypes = {
    bulk_order = {
        name = 'Bulk Order',
        description = 'Deliver large quantity of materials',
        timeLimit = 172800, -- 48 hours
        rewardMultiplier = 1.0,
        minLevel = 0,
        icon = 'box'
    },
    rush_order = {
        name = 'Rush Order',
        description = 'Quick delivery required',
        timeLimit = 21600, -- 6 hours
        rewardMultiplier = 1.8,
        minLevel = 15,
        icon = 'clock'
    },
    quality_order = {
        name = 'Quality Order',
        description = 'High quality materials required',
        timeLimit = 86400, -- 24 hours
        rewardMultiplier = 1.5,
        minLevel = 25,
        qualityRequired = 'seasoned',
        icon = 'star'
    },
    construction = {
        name = 'Construction Contract',
        description = 'Mixed materials for building',
        timeLimit = 259200, -- 72 hours
        rewardMultiplier = 1.3,
        minLevel = 20,
        icon = 'building'
    },
    special_request = {
        name = 'Special Request',
        description = 'Rare materials for unique client',
        timeLimit = 345600, -- 96 hours
        rewardMultiplier = 2.0,
        minLevel = 40,
        icon = 'gem'
    },
    repeating = {
        name = 'Repeating Contract',
        description = 'Daily or weekly standing order',
        timeLimit = nil, -- Ongoing
        rewardMultiplier = 0.9,
        minLevel = 10,
        icon = 'repeat'
    }
}

-- Mission Templates
Config.Missions.Templates = {
    -- Valentine Expansion
    {
        id = 'valentine_expansion',
        name = 'Valentine Expansion Project',
        type = 'construction',
        client = 'Valentine Construction Co.',
        description = 'New buildings being constructed in Valentine',
        requirements = {
            {item = 'oak_plank', amount = 100, quality = 'any'},
            {item = 'beam', amount = 50, quality = 'any'},
            {item = 'post', amount = 20, quality = 'any'}
        },
        destination = vector3(-175.0, 628.0, 114.0),
        reward = 450,
        xpReward = 500,
        minLevel = 15,
        reputation = 25
    },
    -- Saint Denis Furniture
    {
        id = 'saintdenis_furniture',
        name = 'Saint Denis Furniture Order',
        type = 'quality_order',
        client = 'Le Beau Furniture',
        description = 'Fine furniture for wealthy Saint Denis residents',
        requirements = {
            {item = 'furniture_board', amount = 25, quality = 'aged'}
        },
        destination = vector3(2720.0, -1230.0, 49.0),
        reward = 300,
        xpReward = 400,
        minLevel = 40,
        reputation = 30
    },
    -- Bridge Repair
    {
        id = 'riggs_bridge',
        name = 'Emergency Bridge Repair',
        type = 'rush_order',
        client = 'Railroad Company',
        description = 'Bridge damaged, urgent repair needed',
        requirements = {
            {item = 'beam', amount = 40, quality = 'any'}
        },
        destination = vector3(-1050.0, -575.0, 90.0),
        reward = 200,
        xpReward = 300,
        minLevel = 20,
        reputation = 40
    },
    -- Piano Commission
    {
        id = 'blackwater_piano',
        name = 'Blackwater Piano Commission',
        type = 'special_request',
        client = 'Blackwater Theater',
        description = 'Premium wood for piano construction',
        requirements = {
            {item = 'instrument_wood', amount = 10, quality = 'aged'}
        },
        destination = vector3(-813.0, -1325.0, 43.0),
        reward = 600,
        xpReward = 800,
        minLevel = 70,
        reputation = 50,
        uniqueReward = 'master_craftsman_badge'
    },
    -- Bulk Pine
    {
        id = 'bulk_pine_strawberry',
        name = 'Strawberry Bulk Pine Order',
        type = 'bulk_order',
        client = 'Strawberry General Store',
        description = 'Stock up on pine planks',
        requirements = {
            {item = 'pine_plank', amount = 200, quality = 'any'}
        },
        destination = vector3(-1791.0, -387.0, 160.0),
        reward = 250,
        xpReward = 200,
        minLevel = 5,
        reputation = 15
    },
    -- Mining Timber
    {
        id = 'annesburg_mining',
        name = 'Annesburg Mining Timber',
        type = 'bulk_order',
        client = 'Annesburg Mining Co.',
        description = 'Support beams for mine shafts',
        requirements = {
            {item = 'beam', amount = 100, quality = 'any'},
            {item = 'post', amount = 50, quality = 'any'}
        },
        destination = vector3(2930.0, 1290.0, 44.0),
        reward = 500,
        xpReward = 450,
        minLevel = 30,
        reputation = 35
    },
    -- Barrel Order
    {
        id = 'rhodes_barrels',
        name = 'Rhodes Barrel Order',
        type = 'bulk_order',
        client = 'Rhodes Merchant',
        description = 'Barrels for storage and shipping',
        requirements = {
            {item = 'barrel_stave', amount = 120, quality = 'any'}
        },
        destination = vector3(1328.0, -1293.0, 77.0),
        reward = 180,
        xpReward = 250,
        minLevel = 35,
        reputation = 20
    }
}

-- Dynamic Contract Generation
Config.Missions.DynamicGeneration = {
    enabled = true,
    refreshInterval = 3600, -- Generate new contracts every hour
    maxActiveContracts = 20, -- Maximum contracts available globally
    playerMaxActive = 5, -- Maximum active contracts per player
    difficultyScaling = true, -- Scale based on player level
    regionVariation = true -- Different contracts per region
}

-- Contract Rewards
Config.Missions.Rewards = {
    basePayPerUnit = {
        log = 2,
        plank = 3,
        beam = 5,
        furniture_board = 15,
        instrument_wood = 50
    },
    bonuses = {
        earlyCompletion = 1.25, -- 25% bonus
        perfectQuality = 1.20, -- 20% bonus
        bulkBonus = 1.15, -- 15% bonus for large orders
        firstTimeClient = 1.10 -- 10% bonus
    },
    penalties = {
        lateDelivery = 0.75, -- 25% reduction
        damagedGoods = 0.80, -- 20% reduction
        partialDelivery = 0.50 -- 50% reduction
    }
}

-- Reputation System
Config.Missions.Reputation = {
    enabled = true,
    maxReputation = 100,
    benefits = {
        [10] = {unlock = 'better_contracts'},
        [25] = {unlock = 'exclusive_clients', payBonus = 0.05},
        [50] = {unlock = 'priority_contracts', payBonus = 0.10},
        [75] = {unlock = 'bulk_discounts', payBonus = 0.15},
        [100] = {unlock = 'legendary_status', payBonus = 0.25}
    },
    lossConditions = {
        missedDelivery = -10,
        poorQuality = -5,
        contractCancellation = -15
    }
}

-- Delivery Verification
Config.Missions.Verification = {
    requiresPlayerAtLocation = true,
    verificationRadius = 10.0,
    inspectionTime = 5, -- Seconds for NPC to inspect goods
    qualityCheck = true,
    quantityCheck = true,
    rejectionChance = {
        poor_quality = 50,
        damaged = 30,
        wrong_item = 100
    }
}

-- Repeating Contracts
Config.Missions.RepeatingContracts = {
    daily = {
        name = 'Daily Supply',
        refreshTime = 86400, -- 24 hours
        quantities = {low = 10, medium = 25, high = 50},
        payMultiplier = 0.9
    },
    weekly = {
        name = 'Weekly Order',
        refreshTime = 604800, -- 7 days
        quantities = {low = 50, medium = 100, high = 200},
        payMultiplier = 1.1
    }
}

-- Contract Cooldowns
Config.Missions.Cooldowns = {
    betweenContracts = 300, -- 5 minutes between accepting contracts
    afterCompletion = 600, -- 10 minutes after completion
    afterFail = 1800 -- 30 minutes after failing
}

-- Special Events
Config.Missions.SpecialEvents = {
    {
        name = 'Construction Boom',
        description = 'Increased demand for building materials',
        duration = 14400, -- 4 hours
        frequency = 'weekly',
        effects = {
            demandMultiplier = 2.0,
            payMultiplier = 1.5,
            contractSpawnRate = 2.0
        },
        materials = {'beam', 'post', 'plank'}
    },
    {
        name = 'Furniture Fair',
        description = 'Annual furniture exhibition',
        duration = 28800, -- 8 hours
        frequency = 'monthly',
        effects = {
            demandMultiplier = 3.0,
            payMultiplier = 2.0
        },
        materials = {'furniture_board', 'instrument_wood'}
    },
    {
        name = 'Winter Stockpile',
        description = 'Towns preparing for winter',
        duration = 86400, -- 24 hours
        frequency = 'seasonal',
        effects = {
            demandMultiplier = 1.5,
            payMultiplier = 1.3
        },
        materials = {'any'}
    }
}
