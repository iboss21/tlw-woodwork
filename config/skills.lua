Config.Skills = Config.Skills or {}

-- Skill Categories
Config.Skills.Categories = {
    felling = {
        name = 'Felling',
        description = 'Tree cutting expertise',
        icon = 'axe',
        color = '#8B4513'
    },
    milling = {
        name = 'Milling',
        description = 'Sawmill operations',
        icon = 'saw',
        color = '#D2691E'
    },
    carpentry = {
        name = 'Carpentry',
        description = 'Refined crafting',
        icon = 'hammer',
        color = '#CD853F'
    },
    logistics = {
        name = 'Logistics',
        description = 'Transport and delivery',
        icon = 'wagon',
        color = '#DEB887'
    },
    management = {
        name = 'Management',
        description = 'Business operations',
        icon = 'briefcase',
        color = '#F4A460'
    }
}

-- Skill Level Progression
Config.Skills.LevelRanges = {
    [1] = {min = 0, max = 10, title = 'Greenhorn', color = '^7'},
    [2] = {min = 11, max = 25, title = 'Logger', color = '^2'},
    [3] = {min = 26, max = 40, title = 'Sawyer', color = '^3'},
    [4] = {min = 41, max = 60, title = 'Craftsman', color = '^5'},
    [5] = {min = 61, max = 80, title = 'Foreman', color = '^6'},
    [6] = {min = 81, max = 95, title = 'Master', color = '^1'},
    [7] = {min = 96, max = 100, title = 'Legendary', color = '^4'}
}

-- XP Requirements per Level
Config.Skills.XPRequirements = {
    -- Formula: baseXP * level * multiplier
    baseXP = 100,
    multiplier = 1.1, -- Increases per level
    maxLevel = 100
}

-- Felling Skill Benefits
Config.Skills.Felling = {
    activities = {
        chopTree = 10,
        fellLargeTree = 20,
        extractSap = 5,
        debarkTree = 5,
        buckLog = 8
    },
    benefits = {
        -- Level-based benefits
        [10] = {
            unlock = 'oak_birch_access',
            speedBonus = 0.05,
            staminaReduction = 0.05
        },
        [20] = {
            unlock = 'maple_access',
            speedBonus = 0.10,
            staminaReduction = 0.10,
            yieldBonus = 0.05
        },
        [30] = {
            unlock = 'cedar_access',
            speedBonus = 0.15,
            staminaReduction = 0.15,
            yieldBonus = 0.10
        },
        [50] = {
            unlock = 'criticalHitChance',
            speedBonus = 0.20,
            staminaReduction = 0.20,
            yieldBonus = 0.15
        },
        [60] = {
            unlock = 'redwood_access',
            speedBonus = 0.25,
            staminaReduction = 0.25,
            yieldBonus = 0.20
        },
        [80] = {
            unlock = 'expert_felling',
            speedBonus = 0.30,
            staminaReduction = 0.30,
            yieldBonus = 0.25
        },
        [100] = {
            unlock = 'legendary_lumberjack',
            speedBonus = 0.50,
            staminaReduction = 0.50,
            yieldBonus = 0.50
        }
    }
}

-- Milling Skill Benefits
Config.Skills.Milling = {
    activities = {
        processPine = 5,
        processOak = 8,
        processCedar = 12,
        processRedwood = 20,
        createBeam = 10
    },
    benefits = {
        [10] = {
            unlock = 'basic_processing',
            speedBonus = 0.05
        },
        [15] = {
            unlock = 'oak_processing',
            speedBonus = 0.10,
            yieldBonus = 0.05
        },
        [25] = {
            unlock = 'maple_processing',
            speedBonus = 0.15,
            yieldBonus = 0.10
        },
        [30] = {
            unlock = 'cedar_processing',
            speedBonus = 0.20,
            yieldBonus = 0.15
        },
        [40] = {
            unlock = 'concurrent_processing',
            speedBonus = 0.25,
            yieldBonus = 0.20
        },
        [60] = {
            unlock = 'redwood_processing',
            speedBonus = 0.30,
            yieldBonus = 0.25
        },
        [100] = {
            unlock = 'master_sawyer',
            speedBonus = 0.50,
            yieldBonus = 0.50
        }
    }
}

-- Carpentry Skill Benefits
Config.Skills.Carpentry = {
    activities = {
        craftDowel = 3,
        craftFurnitureBoard = 15,
        craftBarrelStave = 10,
        craftInstrumentWood = 30,
        refinePlanks = 8
    },
    benefits = {
        [15] = {
            unlock = 'tool_handles',
            qualityBonus = 0.05
        },
        [25] = {
            unlock = 'wheel_spokes',
            qualityBonus = 0.10,
            speedBonus = 0.05
        },
        [35] = {
            unlock = 'barrel_staves',
            qualityBonus = 0.15,
            speedBonus = 0.10
        },
        [40] = {
            unlock = 'furniture_boards',
            qualityBonus = 0.20,
            speedBonus = 0.15
        },
        [50] = {
            unlock = 'gun_stocks',
            qualityBonus = 0.25,
            speedBonus = 0.20
        },
        [70] = {
            unlock = 'instrument_wood',
            qualityBonus = 0.30,
            speedBonus = 0.25
        },
        [100] = {
            unlock = 'master_craftsman',
            qualityBonus = 0.50,
            speedBonus = 0.50,
            durabilityBonus = 0.30
        }
    }
}

-- Logistics Skill Benefits
Config.Skills.Logistics = {
    activities = {
        loadCargo = 2,
        completeDelivery = 20,
        completeConvoy = 30,
        longDistanceHaul = 40
    },
    benefits = {
        [10] = {
            unlock = 'handcart',
            loadingSpeedBonus = 0.10
        },
        [15] = {
            unlock = 'small_wagon',
            loadingSpeedBonus = 0.15,
            horseFatigueReduction = 0.10
        },
        [25] = {
            unlock = 'route_planning',
            loadingSpeedBonus = 0.20,
            horseFatigueReduction = 0.15,
            payBonus = 0.05
        },
        [30] = {
            unlock = 'large_wagon',
            loadingSpeedBonus = 0.25,
            horseFatigueReduction = 0.20,
            payBonus = 0.10
        },
        [40] = {
            unlock = 'convoy_leader',
            loadingSpeedBonus = 0.30,
            horseFatigueReduction = 0.25,
            payBonus = 0.15
        },
        [50] = {
            unlock = 'lumber_wagon',
            loadingSpeedBonus = 0.35,
            horseFatigueReduction = 0.30,
            payBonus = 0.20
        },
        [100] = {
            unlock = 'logistics_master',
            loadingSpeedBonus = 0.50,
            horseFatigueReduction = 0.50,
            payBonus = 0.50
        }
    }
}

-- Management Skill Benefits
Config.Skills.Management = {
    activities = {
        hirEmployee = 10,
        completeContract = 15,
        sellProducts = 5,
        manageInventory = 3
    },
    benefits = {
        [10] = {
            unlock = 'basic_management',
            npcCostReduction = 0.05
        },
        [20] = {
            unlock = 'small_business',
            npcCostReduction = 0.10,
            employeeEfficiency = 0.05
        },
        [30] = {
            unlock = 'pricing_control',
            npcCostReduction = 0.15,
            employeeEfficiency = 0.10,
            pricingBonus = 0.05
        },
        [40] = {
            unlock = 'analytics',
            npcCostReduction = 0.20,
            employeeEfficiency = 0.15,
            pricingBonus = 0.10
        },
        [50] = {
            unlock = 'enterprise_license',
            npcCostReduction = 0.25,
            employeeEfficiency = 0.20,
            pricingBonus = 0.15
        },
        [75] = {
            unlock = 'market_manipulation',
            npcCostReduction = 0.30,
            employeeEfficiency = 0.25,
            pricingBonus = 0.20
        },
        [100] = {
            unlock = 'business_mogul',
            npcCostReduction = 0.50,
            employeeEfficiency = 0.50,
            pricingBonus = 0.50
        }
    }
}

-- Skill Unlocks Table
Config.Skills.Unlocks = {
    -- Trees
    [0] = {'pine', 'willow'},
    [10] = {'oak', 'birch'},
    [20] = {'maple'},
    [30] = {'cedar'},
    [60] = {'redwood'},
    
    -- Vehicles
    [0] = {'wheelbarrow'},
    [10] = {'handcart'},
    [15] = {'small_wagon'},
    [30] = {'large_wagon'},
    [50] = {'lumber_wagon'},
    
    -- Licenses
    [0] = {'solo_license'},
    [20] = {'small_business_license'},
    [50] = {'enterprise_license'},
    
    -- Features
    [30] = {'hire_npcs'},
    [40] = {'advanced_crafting'},
    [60] = {'multiple_camps'},
    [80] = {'custom_contracts'}
}

-- Title Rewards
Config.Skills.TitleRewards = {
    legendary = {
        title = 'Legendary Woodworker',
        prefix = '[LEGENDARY]',
        color = '^4',
        cosmetics = {
            'golden_axe_skin',
            'master_outfit',
            'legendary_horse_saddle'
        },
        perks = {
            allSkillsBonus = 0.25,
            exclusiveContracts = true,
            freeRepairs = true
        }
    }
}
