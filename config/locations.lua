Config.Locations = Config.Locations or {}

-- Harvesting Zones
Config.Locations.HarvestingZones = {
    {
        name = 'Tall Trees Forest',
        region = 'tall_trees',
        center = vector3(-1500.0, -1800.0, 150.0),
        radius = 500.0,
        allowedTrees = {'pine', 'redwood'},
        density = 0.8,
        blip = {
            enabled = true,
            sprite = 'blip_ambient_tree',
            color = 'BLIP_MODIFIER_MP_COLOR_8'
        }
    },
    {
        name = 'Big Valley Timberland',
        region = 'big_valley',
        center = vector3(-1200.0, 300.0, 120.0),
        radius = 600.0,
        allowedTrees = {'pine', 'cedar', 'oak'},
        density = 0.7,
        blip = {
            enabled = true,
            sprite = 'blip_ambient_tree',
            color = 'BLIP_MODIFIER_MP_COLOR_8'
        }
    },
    {
        name = 'Grizzlies Woods',
        region = 'grizzlies',
        center = vector3(1200.0, 1800.0, 200.0),
        radius = 800.0,
        allowedTrees = {'pine', 'cedar', 'birch'},
        density = 0.6,
        blip = {
            enabled = true,
            sprite = 'blip_ambient_tree',
            color = 'BLIP_MODIFIER_MP_COLOR_8'
        }
    },
    {
        name = 'Heartlands Grove',
        region = 'heartlands',
        center = vector3(300.0, -200.0, 90.0),
        radius = 700.0,
        allowedTrees = {'oak', 'maple'},
        density = 0.5,
        blip = {
            enabled = true,
            sprite = 'blip_ambient_tree',
            color = 'BLIP_MODIFIER_MP_COLOR_8'
        }
    },
    {
        name = 'Roanoke Ridge',
        region = 'roanoke',
        center = vector3(2100.0, 900.0, 110.0),
        radius = 500.0,
        allowedTrees = {'oak', 'birch', 'maple'},
        density = 0.6,
        blip = {
            enabled = true,
            sprite = 'blip_ambient_tree',
            color = 'BLIP_MODIFIER_MP_COLOR_8'
        }
    },
    {
        name = 'Bluewater Marsh',
        region = 'bluewater_marsh',
        center = vector3(2300.0, -500.0, 42.0),
        radius = 400.0,
        allowedTrees = {'willow'},
        density = 0.9,
        blip = {
            enabled = true,
            sprite = 'blip_ambient_tree',
            color = 'BLIP_MODIFIER_MP_COLOR_8'
        }
    }
}

-- Delivery Points
Config.Locations.DeliveryPoints = {
    {
        name = 'Valentine Lumber Yard',
        coords = vector3(-175.0, 627.0, 114.0),
        acceptedMaterials = {'all'},
        payMultiplier = 1.0,
        blip = {
            sprite = 'blip_shop_lumber',
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        }
    },
    {
        name = 'Saint Denis Docks',
        coords = vector3(2720.0, -1231.0, 49.0),
        acceptedMaterials = {'all'},
        payMultiplier = 1.3,
        blip = {
            sprite = 'blip_shop_lumber',
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        }
    },
    {
        name = 'Strawberry Mill',
        coords = vector3(-1791.0, -387.0, 160.0),
        acceptedMaterials = {'log', 'plank'},
        payMultiplier = 0.95,
        blip = {
            sprite = 'blip_shop_lumber',
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        }
    },
    {
        name = 'Annesburg Mine Supply',
        coords = vector3(2930.0, 1290.0, 44.0),
        acceptedMaterials = {'beam', 'post', 'plank'},
        payMultiplier = 1.15,
        blip = {
            sprite = 'blip_shop_lumber',
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        }
    },
    {
        name = 'Rhodes General Store',
        coords = vector3(1328.0, -1293.0, 77.0),
        acceptedMaterials = {'all'},
        payMultiplier = 1.0,
        blip = {
            sprite = 'blip_shop_lumber',
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        }
    },
    {
        name = 'Blackwater Commerce Hub',
        coords = vector3(-813.0, -1324.0, 43.0),
        acceptedMaterials = {'all'},
        payMultiplier = 1.25,
        blip = {
            sprite = 'blip_shop_lumber',
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        }
    }
}

-- Camp Buildable Zones
Config.Locations.CampZones = {
    {
        name = 'Tall Trees Camp Zone',
        center = vector3(-1600.0, -1700.0, 145.0),
        radius = 200.0,
        terrain = 'forest',
        nearestRoad = vector3(-1550.0, -1650.0, 145.0),
        restrictions = {
            minDistanceFromOtherCamps = 100.0,
            requiresLicense = 'solo'
        }
    },
    {
        name = 'Big Valley Camp Zone',
        center = vector3(-1100.0, 350.0, 118.0),
        radius = 250.0,
        terrain = 'valley',
        nearestRoad = vector3(-1050.0, 400.0, 118.0),
        restrictions = {
            minDistanceFromOtherCamps = 100.0,
            requiresLicense = 'solo'
        }
    },
    {
        name = 'Heartlands Camp Zone',
        center = vector3(400.0, -250.0, 88.0),
        radius = 200.0,
        terrain = 'plains',
        nearestRoad = vector3(450.0, -200.0, 88.0),
        restrictions = {
            minDistanceFromOtherCamps = 100.0,
            requiresLicense = 'solo'
        }
    },
    {
        name = 'Grizzlies Camp Zone',
        center = vector3(1300.0, 1850.0, 195.0),
        radius = 180.0,
        terrain = 'mountain',
        nearestRoad = vector3(1250.0, 1800.0, 195.0),
        restrictions = {
            minDistanceFromOtherCamps = 100.0,
            requiresLicense = 'small'
        }
    }
}

-- Roads and Routes
Config.Locations.Roads = {
    mainRoads = {
        {from = vector3(-175.0, 627.0, 114.0), to = vector3(-1791.0, -387.0, 160.0), distance = 1650},
        {from = vector3(-175.0, 627.0, 114.0), to = vector3(2720.0, -1231.0, 49.0), distance = 3200},
        {from = vector3(-813.0, -1324.0, 43.0), to = vector3(2720.0, -1231.0, 49.0), distance = 3600}
    },
    trails = {
        {from = vector3(-1791.0, -387.0, 160.0), to = vector3(-1500.0, -1800.0, 150.0), distance = 1500},
        {from = vector3(1328.0, -1293.0, 77.0), to = vector3(2100.0, 900.0, 110.0), distance = 2250}
    }
}

-- Points of Interest
Config.Locations.POI = {
    {
        name = 'Valentine Timber Office',
        type = 'license_office',
        coords = vector3(-175.0, 625.0, 114.0),
        blip = {
            sprite = 'blip_shop_timber',
            color = 'BLIP_MODIFIER_MP_COLOR_32',
            scale = 0.7
        }
    },
    {
        name = 'State Lumber Camp - Tall Trees',
        type = 'public_operation',
        coords = vector3(-1800.0, -1600.0, 150.0),
        blip = {
            sprite = 'blip_ambient_camp',
            color = 'BLIP_MODIFIER_MP_COLOR_8',
            scale = 0.6
        }
    },
    {
        name = 'State Lumber Camp - Big Valley',
        type = 'public_operation',
        coords = vector3(-1300.0, 400.0, 120.0),
        blip = {
            sprite = 'blip_ambient_camp',
            color = 'BLIP_MODIFIER_MP_COLOR_8',
            scale = 0.6
        }
    }
}

-- Terrain Types
Config.Locations.TerrainTypes = {
    forest = {
        name = 'Forest',
        buildDifficulty = 1.0,
        terrainModifier = 1.0
    },
    plains = {
        name = 'Plains',
        buildDifficulty = 0.8,
        terrainModifier = 1.0
    },
    valley = {
        name = 'Valley',
        buildDifficulty = 0.9,
        terrainModifier = 1.0
    },
    mountain = {
        name = 'Mountain',
        buildDifficulty = 1.3,
        terrainModifier = 0.9
    },
    swamp = {
        name = 'Swamp',
        buildDifficulty = 2.0,
        terrainModifier = 0.7,
        restricted = true
    }
}

-- Region Definitions
Config.Locations.Regions = {
    tall_trees = {name = 'Tall Trees', state = 'West Elizabeth'},
    big_valley = {name = 'Big Valley', state = 'West Elizabeth'},
    grizzlies = {name = 'Grizzlies', state = 'Ambarino'},
    heartlands = {name = 'Heartlands', state = 'New Hanover'},
    roanoke = {name = 'Roanoke Ridge', state = 'New Hanover'},
    bluewater_marsh = {name = 'Bluewater Marsh', state = 'Lemoyne'},
    scarlett_meadows = {name = 'Scarlett Meadows', state = 'Lemoyne'},
    bayou = {name = 'Bayou Nwa', state = 'Lemoyne'}
}
