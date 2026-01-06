Config.Processing = Config.Processing or {}

-- Sawmill Recipes
Config.Processing.Sawmill = {
    ['pine_plank'] = {
        input = 'pine_log',
        inputAmount = 1,
        output = 'pine_plank',
        outputAmount = 4,
        processTime = 8, -- seconds
        requiredSkill = 0,
        xpReward = 5,
        byproducts = {
            {item = 'sawdust', amount = 2, chance = 100},
            {item = 'wood_chips', amount = 1, chance = 50}
        }
    },
    ['oak_plank'] = {
        input = 'oak_log',
        inputAmount = 1,
        output = 'oak_plank',
        outputAmount = 4,
        processTime = 10,
        requiredSkill = 15,
        xpReward = 8,
        byproducts = {
            {item = 'sawdust', amount = 2, chance = 100},
            {item = 'wood_chips', amount = 1, chance = 50}
        }
    },
    ['cedar_plank'] = {
        input = 'cedar_log',
        inputAmount = 1,
        output = 'cedar_plank',
        outputAmount = 4,
        processTime = 12,
        requiredSkill = 30,
        xpReward = 12,
        byproducts = {
            {item = 'sawdust', amount = 2, chance = 100},
            {item = 'wood_chips', amount = 1, chance = 50}
        }
    },
    ['birch_plank'] = {
        input = 'birch_log',
        inputAmount = 1,
        output = 'birch_plank',
        outputAmount = 3,
        processTime = 7,
        requiredSkill = 10,
        xpReward = 6,
        byproducts = {
            {item = 'sawdust', amount = 2, chance = 100},
            {item = 'wood_chips', amount = 1, chance = 50}
        }
    },
    ['redwood_plank'] = {
        input = 'redwood_log',
        inputAmount = 1,
        output = 'redwood_plank',
        outputAmount = 6,
        processTime = 18,
        requiredSkill = 60,
        xpReward = 20,
        byproducts = {
            {item = 'sawdust', amount = 4, chance = 100},
            {item = 'wood_chips', amount = 2, chance = 75}
        }
    },
    ['maple_plank'] = {
        input = 'maple_log',
        inputAmount = 1,
        output = 'maple_plank',
        outputAmount = 4,
        processTime = 10,
        requiredSkill = 25,
        xpReward = 10,
        byproducts = {
            {item = 'sawdust', amount = 2, chance = 100},
            {item = 'wood_chips', amount = 1, chance = 50}
        }
    },
    ['beam'] = {
        input = 'any_log', -- Special case: accepts any log type
        inputAmount = 2,
        output = 'beam',
        outputAmount = 1,
        processTime = 15,
        requiredSkill = 20,
        xpReward = 15,
        byproducts = {
            {item = 'sawdust', amount = 3, chance = 100}
        }
    },
    ['post'] = {
        input = 'any_log',
        inputAmount = 1,
        output = 'post',
        outputAmount = 2,
        processTime = 6,
        requiredSkill = 5,
        xpReward = 4,
        byproducts = {
            {item = 'sawdust', amount = 1, chance = 100}
        }
    },
    ['dowel'] = {
        input = 'any_plank',
        inputAmount = 1,
        output = 'dowel',
        outputAmount = 8,
        processTime = 5,
        requiredSkill = 10,
        xpReward = 3,
        byproducts = {
            {item = 'sawdust', amount = 1, chance = 100}
        }
    },
    ['wood_shingle'] = {
        input = 'cedar_plank',
        inputAmount = 1,
        output = 'wood_shingle',
        outputAmount = 12,
        processTime = 8,
        requiredSkill = 25,
        xpReward = 8,
        byproducts = {
            {item = 'sawdust', amount = 1, chance = 100}
        }
    }
}

-- Carpenter Bench Recipes
Config.Processing.Carpenter = {
    ['furniture_board'] = {
        inputs = {
            {item = 'oak_plank', amount = 2},
            {item = 'sandpaper', amount = 1}
        },
        output = 'furniture_board',
        outputAmount = 1,
        processTime = 20,
        requiredSkill = 40,
        xpReward = 15,
        stationRequired = 'carpenter_bench'
    },
    ['barrel_stave'] = {
        inputs = {
            {item = 'oak_plank', amount = 1}
        },
        output = 'barrel_stave',
        outputAmount = 3,
        processTime = 12,
        requiredSkill = 35,
        xpReward = 10,
        stationRequired = 'carpenter_bench'
    },
    ['wheel_spoke'] = {
        inputs = {
            {item = 'maple_plank', amount = 1}
        },
        output = 'wheel_spoke',
        outputAmount = 4,
        processTime = 10,
        requiredSkill = 30,
        xpReward = 8,
        stationRequired = 'carpenter_bench'
    },
    ['tool_handle'] = {
        inputs = {
            {item = 'any_plank', amount = 1}
        },
        output = 'tool_handle',
        outputAmount = 2,
        processTime = 8,
        requiredSkill = 15,
        xpReward = 5,
        stationRequired = 'carpenter_bench'
    },
    ['gun_stock_blank'] = {
        inputs = {
            {item = 'walnut_plank', amount = 1} -- Note: walnut would need to be added or use maple
        },
        output = 'gun_stock_blank',
        outputAmount = 1,
        processTime = 25,
        requiredSkill = 50,
        xpReward = 20,
        stationRequired = 'carpenter_bench'
    },
    ['instrument_wood'] = {
        inputs = {
            {item = 'maple_plank', amount = 1, qualityRequired = 'aged'}
        },
        output = 'instrument_wood',
        outputAmount = 1,
        processTime = 30,
        requiredSkill = 70,
        xpReward = 30,
        stationRequired = 'carpenter_bench'
    },
    ['varnish'] = {
        inputs = {
            {item = 'refined_resin', amount = 1},
            {item = 'turpentine', amount = 1}
        },
        output = 'varnish',
        outputAmount = 1,
        processTime = 15,
        requiredSkill = 25,
        xpReward = 10,
        stationRequired = 'carpenter_bench'
    }
}

-- Kiln Recipes
Config.Processing.Kiln = {
    ['charcoal'] = {
        inputs = {
            {item = 'kindling', amount = 10}
        },
        output = 'charcoal',
        outputAmount = 5,
        processTime = 180, -- 3 minutes
        requiredSkill = 10,
        xpReward = 8,
        stationRequired = 'charcoal_kiln',
        requiresFire = true
    },
    ['wood_tar'] = {
        inputs = {
            {item = 'tree_bark', amount = 5}
        },
        output = 'wood_tar',
        outputAmount = 2,
        processTime = 240, -- 4 minutes
        requiredSkill = 20,
        xpReward = 12,
        stationRequired = 'charcoal_kiln',
        requiresFire = true
    }
}

-- Pitch Boiler Recipes
Config.Processing.PitchBoiler = {
    ['refined_resin'] = {
        inputs = {
            {item = 'raw_sap', amount = 5}
        },
        output = 'refined_resin',
        outputAmount = 2,
        processTime = 120, -- 2 minutes
        requiredSkill = 15,
        xpReward = 10,
        stationRequired = 'pitch_boiler',
        requiresHeat = true
    },
    ['turpentine'] = {
        inputs = {
            {item = 'refined_resin', amount = 3}
        },
        output = 'turpentine',
        outputAmount = 1,
        processTime = 180,
        requiredSkill = 30,
        xpReward = 15,
        stationRequired = 'pitch_boiler',
        requiresHeat = true
    },
    ['pitch'] = {
        inputs = {
            {item = 'wood_tar', amount = 2},
            {item = 'refined_resin', amount = 1}
        },
        output = 'pitch',
        outputAmount = 2,
        processTime = 150,
        requiredSkill = 25,
        xpReward = 12,
        stationRequired = 'pitch_boiler',
        requiresHeat = true
    }
}

-- Drying Shed (Aging System)
Config.Processing.DryingShed = {
    capacity = 100, -- Maximum planks that can be aged at once
    checkInterval = 3600, -- Check aging progress every hour
    qualityProgression = {
        {from = 'fresh', to = 'dried', time = 21600}, -- 6 hours
        {from = 'dried', to = 'seasoned', time = 86400}, -- 24 hours
        {from = 'seasoned', to = 'aged', time = 259200} -- 72 hours
    },
    acceptedMaterials = {
        'pine_plank',
        'oak_plank',
        'cedar_plank',
        'birch_plank',
        'redwood_plank',
        'maple_plank'
    }
}

-- Crafted Products (Construction & Furniture)
Config.Processing.Crafting = {
    -- Construction Materials
    ['fence_section'] = {
        inputs = {
            {item = 'post', amount = 4},
            {item = 'any_plank', amount = 8}
        },
        output = 'fence_section',
        outputAmount = 1,
        processTime = 30,
        requiredSkill = 20,
        xpReward = 15,
        category = 'construction'
    },
    ['door_frame'] = {
        inputs = {
            {item = 'beam', amount = 2},
            {item = 'any_plank', amount = 4}
        },
        output = 'door_frame',
        outputAmount = 1,
        processTime = 25,
        requiredSkill = 30,
        xpReward = 20,
        category = 'construction'
    },
    ['window_frame'] = {
        inputs = {
            {item = 'beam', amount = 1},
            {item = 'dowel', amount = 6}
        },
        output = 'window_frame',
        outputAmount = 1,
        processTime = 20,
        requiredSkill = 25,
        xpReward = 15,
        category = 'construction'
    },
    -- Furniture
    ['simple_chair'] = {
        inputs = {
            {item = 'any_plank', amount = 4},
            {item = 'dowel', amount = 8}
        },
        output = 'simple_chair',
        outputAmount = 1,
        processTime = 45,
        requiredSkill = 35,
        xpReward = 25,
        category = 'furniture',
        sellValue = 25
    },
    ['table'] = {
        inputs = {
            {item = 'any_plank', amount = 6},
            {item = 'post', amount = 4}
        },
        output = 'table',
        outputAmount = 1,
        processTime = 60,
        requiredSkill = 40,
        xpReward = 30,
        category = 'furniture',
        sellValue = 40
    },
    ['bed_frame'] = {
        inputs = {
            {item = 'any_plank', amount = 8},
            {item = 'post', amount = 4},
            {item = 'dowel', amount = 12}
        },
        output = 'bed_frame',
        outputAmount = 1,
        processTime = 90,
        requiredSkill = 50,
        xpReward = 45,
        category = 'furniture',
        sellValue = 75
    },
    -- Utility Items
    ['barrel'] = {
        inputs = {
            {item = 'barrel_stave', amount = 12},
            {item = 'iron_hoop', amount = 2}
        },
        output = 'barrel',
        outputAmount = 1,
        processTime = 40,
        requiredSkill = 40,
        xpReward = 30,
        category = 'utility',
        sellValue = 35
    },
    ['crate'] = {
        inputs = {
            {item = 'any_plank', amount = 6}
        },
        output = 'crate',
        outputAmount = 1,
        processTime = 15,
        requiredSkill = 15,
        xpReward = 10,
        category = 'utility',
        sellValue = 15
    },
    ['wagon_wheel'] = {
        inputs = {
            {item = 'wheel_spoke', amount = 8},
            {item = 'iron_rim', amount = 1}
        },
        output = 'wagon_wheel',
        outputAmount = 1,
        processTime = 50,
        requiredSkill = 45,
        xpReward = 35,
        category = 'utility',
        sellValue = 50
    }
}

-- Processing Stations
Config.Processing.Stations = {
    sawmill = {
        name = 'Sawmill Station',
        recipes = Config.Processing.Sawmill,
        concurrent = 1, -- Number of items that can be processed at once
        upgradeMultiplier = 2 -- With upgrade, can process 2 at once
    },
    carpenter = {
        name = 'Carpenter Bench',
        recipes = Config.Processing.Carpenter,
        concurrent = 1
    },
    kiln = {
        name = 'Charcoal Kiln',
        recipes = Config.Processing.Kiln,
        concurrent = 3 -- Can process multiple batches
    },
    pitch_boiler = {
        name = 'Pitch Boiler',
        recipes = Config.Processing.PitchBoiler,
        concurrent = 2
    },
    drying_shed = {
        name = 'Drying Shed',
        capacity = 100,
        checkInterval = 3600
    }
}
