Config.Structures = Config.Structures or {}

-- Core Structures
Config.Structures.Core = {
    ['main_office'] = {
        name = 'Main Office',
        description = 'Business hub and safe storage',
        model = 'p_buildingset01x', -- Replace with actual model
        cost = 500,
        requiredLicense = 'solo',
        category = 'core',
        required = true, -- Must place first
        features = {
            storage = 100,
            safeStorage = true,
            spawnPoint = true,
            managementTerminal = true
        },
        size = {x = 6, y = 6, z = 4},
        flatTerrainRequired = true,
        snapToGround = true
    },
    ['sawmill'] = {
        name = 'Sawmill Station',
        description = 'Process logs into planks',
        model = 'p_sawmill01x',
        cost = 1000,
        requiredLicense = 'solo',
        category = 'production',
        features = {
            processing = 'sawmill',
            concurrent = 1,
            upgradeSlots = 2
        },
        size = {x = 8, y = 8, z = 5},
        flatTerrainRequired = true,
        snapToGround = true,
        powerRequired = false
    },
    ['drying_shed'] = {
        name = 'Drying Shed',
        description = 'Age planks for quality improvement',
        model = 'p_shed01x',
        cost = 750,
        requiredLicense = 'small',
        category = 'production',
        features = {
            aging = true,
            capacity = 100,
            weatherProtected = true
        },
        size = {x = 10, y = 6, z = 4},
        flatTerrainRequired = true,
        snapToGround = true
    },
    ['storage_barn'] = {
        name = 'Storage Barn',
        description = 'Bulk material storage',
        model = 'p_barn01x',
        cost = 600,
        requiredLicense = 'solo',
        category = 'storage',
        features = {
            storage = 500,
            weatherProtected = true,
            organized = true
        },
        size = {x = 12, y = 8, y = 6},
        flatTerrainRequired = true,
        snapToGround = true
    },
    ['worker_quarters'] = {
        name = 'Worker Quarters',
        description = 'Employee spawn and rest area',
        model = 'p_bunkhouse01x',
        cost = 800,
        requiredLicense = 'small',
        category = 'utility',
        features = {
            employeeSpawn = true,
            staminaRecovery = true,
            beds = 6
        },
        size = {x = 8, y = 10, z = 4},
        flatTerrainRequired = true,
        snapToGround = true
    },
    ['stables'] = {
        name = 'Stables',
        description = 'Horse and vehicle storage',
        model = 'p_stable01x',
        cost = 500,
        requiredLicense = 'solo',
        category = 'storage',
        features = {
            horseStorage = 4,
            vehicleParking = 2,
            horseCare = true
        },
        size = {x = 10, y = 8, z = 5},
        flatTerrainRequired = true,
        snapToGround = true
    }
}

-- Production Structures
Config.Structures.Production = {
    ['sap_station'] = {
        name = 'Sap Collection Station',
        description = 'Process tree sap',
        model = 'p_sapstation01x',
        cost = 400,
        requiredLicense = 'small',
        category = 'production',
        features = {
            processing = 'sap',
            storageCapacity = 50
        },
        size = {x = 4, y = 4, z = 3},
        flatTerrainRequired = false
    },
    ['charcoal_kiln'] = {
        name = 'Charcoal Kiln',
        description = 'Create charcoal and tar',
        model = 'p_kiln01x',
        cost = 650,
        requiredLicense = 'small',
        category = 'production',
        features = {
            processing = 'kiln',
            concurrent = 3,
            fireRequired = true
        },
        size = {x = 5, y = 5, z = 4},
        flatTerrainRequired = true,
        fireHazard = true
    },
    ['carpenter_bench'] = {
        name = 'Carpenter Bench',
        description = 'Craft refined products',
        model = 'p_workbench01x',
        cost = 850,
        requiredLicense = 'small',
        category = 'production',
        features = {
            processing = 'carpenter',
            toolStorage = true
        },
        size = {x = 6, y = 4, z = 3},
        flatTerrainRequired = true,
        roofRequired = true
    },
    ['tool_repair'] = {
        name = 'Tool Repair Station',
        description = 'Repair and maintain tools',
        model = 'p_toolbench01x',
        cost = 500,
        requiredLicense = 'small',
        category = 'utility',
        features = {
            repair = true,
            toolStorage = 20
        },
        size = {x = 4, y = 4, z = 3},
        flatTerrainRequired = true
    },
    ['pitch_boiler'] = {
        name = 'Pitch Boiler',
        description = 'Refine resin and create pitch',
        model = 'p_boiler01x',
        cost = 700,
        requiredLicense = 'small',
        category = 'production',
        features = {
            processing = 'pitch_boiler',
            concurrent = 2,
            heatRequired = true
        },
        size = {x = 5, y = 5, z = 4},
        flatTerrainRequired = true,
        fireHazard = true
    }
}

-- Utility Structures
Config.Structures.Utility = {
    ['water_trough'] = {
        name = 'Water Trough',
        description = 'Horse watering station',
        model = 'p_watertrough01x',
        cost = 50,
        requiredLicense = 'solo',
        category = 'utility',
        features = {
            horseStamina = true
        },
        size = {x = 3, y = 2, z = 1},
        flatTerrainRequired = false
    },
    ['hitching_post'] = {
        name = 'Hitching Post',
        description = 'Temporary horse parking',
        model = 'p_hitchingpost01x',
        cost = 25,
        requiredLicense = 'solo',
        category = 'utility',
        features = {
            horseParking = 2
        },
        size = {x = 4, y = 1, z = 2},
        flatTerrainRequired = false
    },
    ['fence'] = {
        name = 'Fence Section',
        description = 'Define camp perimeter',
        model = 'p_fence01x',
        cost = 10,
        requiredLicense = 'solo',
        category = 'decorative',
        features = {
            perimeter = true,
            connectable = true
        },
        size = {x = 4, y = 0.5, z = 2},
        flatTerrainRequired = false
    },
    ['gate'] = {
        name = 'Gate',
        description = 'Camp entrance with access control',
        model = 'p_gate01x',
        cost = 75,
        requiredLicense = 'small',
        category = 'utility',
        features = {
            accessControl = true,
            openable = true
        },
        size = {x = 4, y = 0.5, z = 3},
        flatTerrainRequired = false
    },
    ['lantern_post'] = {
        name = 'Lantern Post',
        description = 'Lighting for night work',
        model = 'p_lanternpost01x',
        cost = 15,
        requiredLicense = 'solo',
        category = 'decorative',
        features = {
            lighting = true,
            radius = 10.0
        },
        size = {x = 1, y = 1, z = 4},
        flatTerrainRequired = false
    },
    ['fire_pit'] = {
        name = 'Fire Pit',
        description = 'Warmth and cooking',
        model = 'p_firepit01x',
        cost = 30,
        requiredLicense = 'solo',
        category = 'utility',
        features = {
            warmth = true,
            radius = 5.0,
            cooking = true
        },
        size = {x = 3, y = 3, z = 1},
        flatTerrainRequired = true,
        fireHazard = true
    },
    ['outhouse'] = {
        name = 'Outhouse',
        description = 'Sanitation facility',
        model = 'p_outhouse01x',
        cost = 50,
        requiredLicense = 'solo',
        category = 'decorative',
        features = {
            immersion = true
        },
        size = {x = 2, y = 2, z = 3},
        flatTerrainRequired = true
    },
    ['notice_board'] = {
        name = 'Notice Board',
        description = 'Job postings and contracts',
        model = 'p_noticeboard01x',
        cost = 40,
        requiredLicense = 'small',
        category = 'utility',
        features = {
            jobPosting = true,
            contracts = true
        },
        size = {x = 2, y = 1, z = 2},
        flatTerrainRequired = false
    }
}

-- Placement Rules
Config.Structures.PlacementRules = {
    minSpacing = 2.0, -- Minimum distance between structures
    maxCampRadius = 50.0, -- Maximum distance from camp center
    flatTerrainAngle = 15, -- Maximum slope angle for flat terrain check
    terrainRestrictions = {
        water = false,
        swamp = false,
        mountain = false,
        cliff = false
    },
    roadProximityRequired = true,
    maxRoadDistance = 50.0,
    snapToGrid = true,
    gridSize = 1.0 -- 1 meter grid
}

-- Build Mode Settings
Config.Structures.BuildMode = {
    cameraHeight = 20.0,
    cameraAngle = 45.0,
    rotationSpeed = 2.0,
    movementSpeed = 0.5,
    gridColor = {r = 255, g = 255, b = 255, a = 50},
    validPlacementColor = {r = 0, g = 255, b = 0, a = 100},
    invalidPlacementColor = {r = 255, g = 0, b = 0, a = 100},
    showRadius = true,
    showSnapPoints = true
}

-- Structure Upgrades
Config.Structures.Upgrades = {
    sawmill = {
        tier2 = {
            name = 'Advanced Sawmill',
            cost = 2000,
            requiredLevel = 30,
            benefits = {
                concurrent = 2,
                speedMultiplier = 1.5
            }
        },
        tier3 = {
            name = 'Industrial Sawmill',
            cost = 5000,
            requiredLevel = 60,
            benefits = {
                concurrent = 3,
                speedMultiplier = 2.0,
                yieldBonus = 0.2
            }
        }
    },
    storage_barn = {
        expansion1 = {
            name = 'Barn Extension',
            cost = 1000,
            requiredLevel = 25,
            benefits = {
                storage = 750
            }
        },
        expansion2 = {
            name = 'Warehouse',
            cost = 3000,
            requiredLevel = 50,
            benefits = {
                storage = 1500
            }
        }
    }
}
