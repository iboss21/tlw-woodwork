Config.Shops = Config.Shops or {}

-- NPC Shop Locations
Config.Shops.Locations = {
    ['valentine'] = {
        name = 'Valentine Lumber Co.',
        coords = vector3(-175.68, 627.32, 114.09),
        blip = {
            sprite = 'blip_shop_lumber',
            scale = 0.6,
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        },
        npc = {
            model = 'u_m_m_blwlumberjack_01',
            heading = 180.0
        },
        buyPriceMultiplier = 1.0,
        sellPriceMultiplier = 1.0,
        specialty = 'construction',
        stock = {
            tools = true,
            materials = true,
            vehicles = true
        }
    },
    ['saintdenis'] = {
        name = 'Saint Denis Timber & Supply',
        coords = vector3(2720.0, -1231.0, 49.37),
        blip = {
            sprite = 'blip_shop_lumber',
            scale = 0.6,
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        },
        npc = {
            model = 'u_m_m_blwlumberjack_01',
            heading = 90.0
        },
        buyPriceMultiplier = 1.2,
        sellPriceMultiplier = 1.3,
        specialty = 'finished_goods',
        stock = {
            tools = true,
            materials = true,
            vehicles = true,
            premium = true
        }
    },
    ['strawberry'] = {
        name = 'Strawberry Mill',
        coords = vector3(-1791.0, -387.0, 160.33),
        blip = {
            sprite = 'blip_shop_lumber',
            scale = 0.6,
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        },
        npc = {
            model = 'u_m_m_blwlumberjack_01',
            heading = 270.0
        },
        buyPriceMultiplier = 0.9,
        sellPriceMultiplier = 0.95,
        specialty = 'raw_logs',
        stock = {
            tools = true,
            materials = true
        }
    },
    ['annesburg'] = {
        name = 'Annesburg Supply Co.',
        coords = vector3(2930.0, 1290.0, 44.65),
        blip = {
            sprite = 'blip_shop_lumber',
            scale = 0.6,
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        },
        npc = {
            model = 'u_m_m_blwlumberjack_01',
            heading = 180.0
        },
        buyPriceMultiplier = 1.0,
        sellPriceMultiplier = 1.15,
        specialty = 'mining_timber',
        stock = {
            tools = true,
            materials = true
        }
    },
    ['rhodes'] = {
        name = 'Rhodes General Store',
        coords = vector3(1328.0, -1293.0, 77.04),
        blip = {
            sprite = 'blip_shop_lumber',
            scale = 0.6,
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        },
        npc = {
            model = 'u_m_m_blwlumberjack_01',
            heading = 0.0
        },
        buyPriceMultiplier = 1.1,
        sellPriceMultiplier = 1.0,
        specialty = 'farm_materials',
        stock = {
            tools = true,
            materials = true
        }
    },
    ['blackwater'] = {
        name = 'Blackwater Commerce',
        coords = vector3(-813.0, -1324.0, 43.63),
        blip = {
            sprite = 'blip_shop_lumber',
            scale = 0.6,
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        },
        npc = {
            model = 'u_m_m_blwlumberjack_01',
            heading = 90.0
        },
        buyPriceMultiplier = 1.15,
        sellPriceMultiplier = 1.25,
        specialty = 'premium_goods',
        stock = {
            tools = true,
            materials = true,
            vehicles = true,
            premium = true
        }
    },
    ['tumbleweed'] = {
        name = 'Tumbleweed Trading Post',
        coords = vector3(-5514.0, -2952.0, -2.39),
        blip = {
            sprite = 'blip_shop_lumber',
            scale = 0.6,
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        },
        npc = {
            model = 'u_m_m_blwlumberjack_01',
            heading = 180.0
        },
        buyPriceMultiplier = 0.8,
        sellPriceMultiplier = 0.9,
        specialty = 'bulk_discount',
        stock = {
            tools = true,
            materials = true
        }
    },
    ['vanhorn'] = {
        name = 'Van Horn Fence',
        coords = vector3(2975.0, 570.0, 44.67),
        blip = {
            sprite = 'blip_shop_lumber',
            scale = 0.6,
            color = 'BLIP_MODIFIER_MP_COLOR_32'
        },
        npc = {
            model = 'u_m_m_blwlumberjack_01',
            heading = 270.0
        },
        buyPriceMultiplier = 0.7,
        sellPriceMultiplier = 1.4,
        specialty = 'no_questions',
        stock = {
            materials = true,
            stolen = true -- Accepts stolen goods
        }
    }
}

-- Dynamic Pricing System
Config.Shops.DynamicPricing = {
    enabled = true,
    updateInterval = 3600, -- Update every hour
    supplyThresholds = {
        oversupply = {min = 0, max = 30, priceMultiplier = 0.7},
        abundant = {min = 30, max = 50, priceMultiplier = 0.85},
        normal = {min = 50, max = 70, priceMultiplier = 1.0},
        scarce = {min = 70, max = 90, priceMultiplier = 1.3},
        critical = {min = 90, max = 100, priceMultiplier = 1.6}
    },
    globalDemandFactors = {
        constructionBoom = 1.3, -- Random events
        economicDownturn = 0.8,
        seasonalDemand = 1.1
    }
}

-- Shop Stock Limits
Config.Shops.StockLimits = {
    tools = {
        refreshInterval = 3600, -- Restock every hour
        maxQuantity = 10 -- Maximum of each tool type
    },
    materials = {
        refreshInterval = 1800, -- Restock every 30 min
        maxQuantity = 100 -- Maximum of each material type
    },
    vehicles = {
        refreshInterval = 7200, -- Restock every 2 hours
        maxQuantity = 3
    }
}

-- Government License Office
Config.Shops.LicenseOffice = {
    name = 'Woodworking License Office',
    coords = vector3(-175.0, 625.0, 114.0), -- Near Valentine
    npc = {
        model = 'u_m_m_valdeputy_01',
        heading = 180.0
    },
    licenses = {
        solo = {
            name = 'Solo Operator License',
            description = 'Personal use only, no employees',
            cost = 5000,
            benefits = {
                'Personal harvesting rights',
                'Access to sawmill',
                'Sell to shops'
            }
        },
        small = {
            name = 'Small Business License',
            description = 'Up to 5 employees',
            cost = 25000,
            requiredLevel = 20,
            benefits = {
                'Hire up to 5 employees',
                'Single camp location',
                'Business bank account',
                'Set custom prices'
            }
        },
        enterprise = {
            name = 'Enterprise License',
            description = 'Unlimited employees, multiple locations',
            cost = 100000,
            requiredLevel = 50,
            benefits = {
                'Unlimited employees',
                'Multiple camp locations',
                'Advanced analytics',
                'Priority shipping',
                'Custom contracts'
            }
        }
    }
}

-- Market Trends Display
Config.Shops.MarketTrends = {
    enabled = true,
    historyDays = 7, -- Track 7 days of price history
    showPredictions = true, -- Show predicted trends
    topMaterials = 10 -- Show top 10 trending materials
}
