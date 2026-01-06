Config.Vehicles = Config.Vehicles or {}

-- Transport Vehicles
Config.Vehicles.Types = {
    ['wheelbarrow'] = {
        name = 'Wheelbarrow',
        description = 'Small hand-pushed cart',
        capacity = {
            logs = 2,
            planks = 20,
            weight = 100
        },
        speed = 'walk', -- Player walk speed
        terrain = {'road'},
        cost = 25,
        requiredSkill = 0,
        model = 'p_wheelbarrow01x',
        requiresHorse = false,
        durability = 200
    },
    ['handcart'] = {
        name = 'Handcart',
        description = 'Larger hand-pulled cart',
        capacity = {
            logs = 4,
            planks = 40,
            weight = 200
        },
        speed = 'walk',
        terrain = {'road', 'trail'},
        cost = 75,
        requiredSkill = 0,
        model = 'p_cart02x',
        requiresHorse = false,
        durability = 300
    },
    ['horse_drag'] = {
        name = 'Horse + Drag',
        description = 'Horse dragging logs',
        capacity = {
            logs = 3,
            planks = 0, -- Only logs
            weight = 150
        },
        speed = 'horse_slow',
        terrain = {'any'},
        cost = 150,
        requiredSkill = 10,
        model = 'p_log_drag01x',
        requiresHorse = true,
        horseStaminaDrain = 1.5,
        durability = 150
    },
    ['small_wagon'] = {
        name = 'Small Wagon',
        description = 'Basic cargo wagon',
        capacity = {
            logs = 8,
            planks = 80,
            weight = 400
        },
        speed = 'slow',
        terrain = {'road', 'trail'},
        cost = 300,
        requiredSkill = 15,
        model = 'cart01',
        requiresHorse = true,
        horseCount = 1,
        horseStaminaDrain = 2.0,
        durability = 500
    },
    ['large_wagon'] = {
        name = 'Large Wagon',
        description = 'Heavy duty cargo wagon',
        capacity = {
            logs = 20,
            planks = 200,
            weight = 1000
        },
        speed = 'very_slow',
        terrain = {'road'},
        cost = 750,
        requiredSkill = 30,
        model = 'cart03',
        requiresHorse = true,
        horseCount = 2,
        horseStaminaDrain = 3.0,
        durability = 800
    },
    ['lumber_wagon'] = {
        name = 'Lumber Wagon',
        description = 'Specialized lumber transport',
        capacity = {
            logs = 40,
            planks = 400,
            weight = 2000
        },
        speed = 'slow',
        terrain = {'road'},
        cost = 1500,
        requiredSkill = 50,
        model = 'cart07',
        requiresHorse = true,
        horseCount = 4,
        horseStaminaDrain = 4.0,
        durability = 1000,
        specialFeature = 'auto_stack'
    }
}

-- Loading/Unloading Mechanics
Config.Vehicles.Loading = {
    loadTimePerLog = 3, -- seconds
    loadTimePerPlank = 1,
    unloadTimePerLog = 2,
    unloadTimePerPlank = 0.5,
    maxCarryWeight = 50, -- Player can carry 50 weight at once
    overloadPenalty = {
        speedReduction = 0.5, -- 50% slower when overloaded
        wheelBreakChance = 5, -- 5% per trip when overloaded
        horseInjuryChance = 2, -- 2% per trip
        cargoSpillChance = 10 -- 10% on rough terrain
    },
    visualStacking = true -- Show stacked cargo visually
}

-- Shipping Routes
Config.Vehicles.Routes = {
    ['local'] = {
        name = 'Local Delivery',
        description = 'Deliver to nearest town',
        distanceRange = {min = 0, max = 500},
        payMultiplier = 1.0,
        minCargoRequired = 10,
        timeLimit = 3600, -- 1 hour
        regions = {'any'}
    },
    ['regional'] = {
        name = 'Regional Transport',
        description = 'Deliver to adjacent region',
        distanceRange = {min = 500, max = 2000},
        payMultiplier = 1.5,
        minCargoRequired = 50,
        timeLimit = 7200, -- 2 hours
        regions = {'any'}
    },
    ['cross_state'] = {
        name = 'Cross-State Haul',
        description = 'Long distance delivery',
        distanceRange = {min = 2000, max = 5000},
        payMultiplier = 2.5,
        minCargoRequired = 100,
        timeLimit = 14400, -- 4 hours
        regions = {'any'}
    },
    ['express'] = {
        name = 'Express Delivery',
        description = 'Time-critical delivery',
        distanceRange = {min = 0, max = 3000},
        payMultiplier = 2.0,
        minCargoRequired = 25,
        timeLimit = 3600, -- 1 hour tight deadline
        regions = {'any'},
        bonusOnTime = 1.5 -- Extra 50% if delivered early
    }
}

-- Multiplayer Convoys
Config.Vehicles.Convoys = {
    enabled = true,
    maxSize = 6,
    formationDistance = 10.0, -- Distance between wagons
    roles = {
        leader = {
            name = 'Convoy Leader',
            payBonus = 1.2,
            permissions = {'set_pace', 'choose_route', 'call_stops'}
        },
        escort = {
            name = 'Escort',
            payBonus = 1.1,
            permissions = {'protect', 'scout'}
        },
        driver = {
            name = 'Driver',
            payBonus = 1.0,
            permissions = {'follow'}
        }
    },
    bonuses = {
        groupSizeMultiplier = {
            [2] = 1.1, -- 10% bonus for 2 players
            [3] = 1.2,
            [4] = 1.3,
            [5] = 1.4,
            [6] = 1.5
        },
        successBonus = 1.25, -- 25% bonus if all arrive safely
        speedBonus = 1.15 -- 15% bonus if delivered quickly
    },
    threats = {
        banditAmbush = {
            enabled = true,
            chance = 15, -- 15% chance per convoy
            difficulty = 'scales_with_cargo_value'
        }
    }
}

-- Vehicle Damage System
Config.Vehicles.Damage = {
    wheelDurability = 100,
    wheelRepairCost = 25,
    wheelRepairTime = 30,
    axleDurability = 150,
    axleRepairCost = 50,
    axleRepairTime = 60,
    damagePerRoughTerrain = 1, -- Per 100m on rough terrain
    damagePerOverload = 2, -- Per trip when overloaded
    catastrophicFailureChance = 1 -- 1% chance of major breakdown
}

-- Speed Modifiers
Config.Vehicles.SpeedModifiers = {
    walk = 1.0,
    horse_slow = 3.0,
    slow = 2.5,
    very_slow = 1.5,
    terrainMultipliers = {
        road = 1.0,
        trail = 0.8,
        dirt = 0.6,
        rough = 0.4,
        swamp = 0.3
    },
    weatherMultipliers = {
        clear = 1.0,
        rain = 0.8,
        snow = 0.6,
        fog = 0.9
    }
}
