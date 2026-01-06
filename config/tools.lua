Config.Tools = Config.Tools or {}

-- Harvesting Tools
Config.Tools.Harvesting = {
    ['hatchet'] = {
        name = 'Hatchet',
        description = 'Basic tree cutting tool',
        durability = 50,
        speedMultiplier = 1.0,
        yieldBonus = 0.0,
        cost = 15,
        requiredSkill = 0,
        repairCost = 5,
        repairItems = {
            {item = 'iron_ingot', amount = 1},
            {item = 'tool_handle', amount = 1}
        },
        category = 'harvesting'
    },
    ['felling_axe'] = {
        name = 'Felling Axe',
        description = 'Improved axe for faster tree cutting',
        durability = 100,
        speedMultiplier = 1.3,
        yieldBonus = 0.10,
        cost = 45,
        requiredSkill = 10,
        repairCost = 12,
        repairItems = {
            {item = 'iron_ingot', amount = 2},
            {item = 'tool_handle', amount = 1}
        },
        category = 'harvesting'
    },
    ['broad_axe'] = {
        name = 'Broad Axe',
        description = 'Wide blade for efficient cutting',
        durability = 80,
        speedMultiplier = 1.2,
        yieldBonus = 0.20,
        cost = 60,
        requiredSkill = 20,
        repairCost = 15,
        repairItems = {
            {item = 'steel_ingot', amount = 2},
            {item = 'tool_handle', amount = 1}
        },
        category = 'harvesting'
    },
    ['two_man_saw'] = {
        name = 'Two-Man Saw',
        description = 'Large saw requiring two operators',
        durability = 150,
        speedMultiplier = 1.8,
        yieldBonus = 0.25,
        cost = 120,
        requiredSkill = 30,
        requiresTwoPlayers = true,
        repairCost = 25,
        repairItems = {
            {item = 'steel_ingot', amount = 3},
            {item = 'tool_handle', amount = 2}
        },
        category = 'harvesting'
    },
    ['crosscut_saw'] = {
        name = 'Crosscut Saw',
        description = 'Professional logging saw',
        durability = 120,
        speedMultiplier = 1.5,
        yieldBonus = 0.15,
        cost = 80,
        requiredSkill = 25,
        repairCost = 18,
        repairItems = {
            {item = 'steel_ingot', amount = 2},
            {item = 'tool_handle', amount = 1}
        },
        category = 'harvesting'
    }
}

-- Processing Tools
Config.Tools.Processing = {
    ['hand_saw'] = {
        name = 'Hand Saw',
        description = 'Basic sawing tool',
        durability = 60,
        speedMultiplier = 1.0,
        qualityBonus = 0.0,
        cost = 20,
        requiredSkill = 0,
        stationUsed = 'sawmill',
        repairCost = 8,
        category = 'processing'
    },
    ['drawknife'] = {
        name = 'Drawknife',
        description = 'Shaping and smoothing tool',
        durability = 80,
        speedMultiplier = 1.2,
        qualityBonus = 0.05,
        cost = 35,
        requiredSkill = 15,
        stationUsed = 'carpenter',
        repairCost = 12,
        category = 'processing'
    },
    ['wood_plane'] = {
        name = 'Wood Plane',
        description = 'Precision smoothing plane',
        durability = 100,
        speedMultiplier = 1.0,
        qualityBonus = 0.15,
        cost = 50,
        requiredSkill = 20,
        stationUsed = 'carpenter',
        repairCost = 15,
        category = 'processing'
    },
    ['chisel_set'] = {
        name = 'Chisel Set',
        description = 'Fine detail work tools',
        durability = 120,
        speedMultiplier = 1.1,
        qualityBonus = 0.10,
        cost = 65,
        requiredSkill = 25,
        stationUsed = 'carpenter',
        repairCost = 18,
        category = 'processing'
    },
    ['sandpaper'] = {
        name = 'Sandpaper',
        description = 'Finishing material',
        durability = 20,
        speedMultiplier = 1.0,
        qualityBonus = 0.20,
        cost = 5,
        requiredSkill = 10,
        stationUsed = 'carpenter',
        repairCost = 2,
        consumable = true,
        category = 'processing'
    }
}

-- Tool Repair System
Config.Tools.Repair = {
    repairKitBasic = {
        name = 'Basic Repair Kit',
        cost = 10,
        durabilityRestore = 25,
        requiredSkill = 0
    },
    repairKitAdvanced = {
        name = 'Advanced Repair Kit',
        cost = 25,
        durabilityRestore = 50,
        requiredSkill = 20
    },
    repairKitProfessional = {
        name = 'Professional Repair Kit',
        cost = 50,
        durabilityRestore = 100,
        requiredSkill = 40
    }
}

-- Tool Degradation Settings
Config.Tools.Degradation = {
    normalUse = 1, -- Durability lost per normal use
    heavyUse = 2, -- Durability lost for difficult tasks (redwood, etc)
    criticalFailure = 5, -- Extra durability lost on crit fail
    weatherMultiplier = {
        rain = 1.5,
        snow = 1.8,
        normal = 1.0
    },
    brokenToolPenalty = 0.5 -- 50% slower when using broken tool
}

-- Tool Animations
Config.Tools.Animations = {
    hatchet = {
        dict = 'script_re@moonshine_camp@ai_acts@woodchop@male@stand',
        anim = 'chop_swing',
        flag = 1
    },
    saw = {
        dict = 'script_re@moonshine_camp@ai_acts@woodchop@male@stand', 
        anim = 'saw_motion',
        flag = 1
    },
    plane = {
        dict = 'amb_work@world_human_plane_wood@male_a@base',
        anim = 'base',
        flag = 1
    },
    generic = {
        dict = 'amb_work@world_human_box_pickup@male_a@base',
        anim = 'base',
        flag = 1
    }
}
