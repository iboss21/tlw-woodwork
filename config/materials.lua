Config.Materials = Config.Materials or {}

-- Raw Materials (Harvested from trees)
Config.Materials.Raw = {
    ['pine_log'] = {
        name = 'Pine Log',
        description = 'A sturdy pine log suitable for processing',
        weight = 50,
        baseValue = 3,
        category = 'raw_wood',
        stackable = true,
        maxStack = 10,
        sellable = true
    },
    ['oak_log'] = {
        name = 'Oak Log',
        description = 'A strong oak log, highly valued',
        weight = 65,
        baseValue = 6,
        category = 'raw_wood',
        stackable = true,
        maxStack = 10,
        sellable = true
    },
    ['cedar_log'] = {
        name = 'Cedar Log',
        description = 'Aromatic cedar log, excellent for crafting',
        weight = 55,
        baseValue = 8,
        category = 'raw_wood',
        stackable = true,
        maxStack = 10,
        sellable = true
    },
    ['birch_log'] = {
        name = 'Birch Log',
        description = 'Light birch log, easy to work with',
        weight = 40,
        baseValue = 4,
        category = 'raw_wood',
        stackable = true,
        maxStack = 10,
        sellable = true
    },
    ['redwood_log'] = {
        name = 'Redwood Log',
        description = 'Massive redwood log, extremely valuable',
        weight = 120,
        baseValue = 15,
        category = 'raw_wood',
        stackable = true,
        maxStack = 5,
        sellable = true
    },
    ['maple_log'] = {
        name = 'Maple Log',
        description = 'Dense maple log, perfect for fine work',
        weight = 60,
        baseValue = 7,
        category = 'raw_wood',
        stackable = true,
        maxStack = 10,
        sellable = true
    },
    ['willow_log'] = {
        name = 'Willow Log',
        description = 'Flexible willow log',
        weight = 35,
        baseValue = 2,
        category = 'raw_wood',
        stackable = true,
        maxStack = 15,
        sellable = true
    },
    ['raw_sap'] = {
        name = 'Raw Sap',
        description = 'Sticky tree sap, can be refined',
        weight = 2,
        baseValue = 1,
        category = 'byproduct',
        stackable = true,
        maxStack = 50,
        sellable = true
    },
    ['tree_bark'] = {
        name = 'Tree Bark',
        description = 'Stripped tree bark',
        weight = 5,
        baseValue = 0.50,
        category = 'byproduct',
        stackable = true,
        maxStack = 50,
        sellable = true
    },
    ['kindling'] = {
        name = 'Kindling',
        description = 'Small wood pieces for fire starting',
        weight = 3,
        baseValue = 0.25,
        category = 'byproduct',
        stackable = true,
        maxStack = 100,
        sellable = true
    }
}

-- Processed Materials (Created at Sawmill)
Config.Materials.Processed = {
    ['pine_plank'] = {
        name = 'Pine Plank',
        description = 'Processed pine plank',
        weight = 12,
        baseValue = 4,
        category = 'processed_wood',
        stackable = true,
        maxStack = 50,
        sellable = true,
        qualityTiers = true -- Can be fresh/dried/seasoned/aged
    },
    ['oak_plank'] = {
        name = 'Oak Plank',
        description = 'Processed oak plank',
        weight = 15,
        baseValue = 8,
        category = 'processed_wood',
        stackable = true,
        maxStack = 50,
        sellable = true,
        qualityTiers = true
    },
    ['cedar_plank'] = {
        name = 'Cedar Plank',
        description = 'Processed cedar plank',
        weight = 13,
        baseValue = 10,
        category = 'processed_wood',
        stackable = true,
        maxStack = 50,
        sellable = true,
        qualityTiers = true
    },
    ['birch_plank'] = {
        name = 'Birch Plank',
        description = 'Processed birch plank',
        weight = 10,
        baseValue = 5,
        category = 'processed_wood',
        stackable = true,
        maxStack = 50,
        sellable = true,
        qualityTiers = true
    },
    ['redwood_plank'] = {
        name = 'Redwood Plank',
        description = 'Processed redwood plank',
        weight = 18,
        baseValue = 20,
        category = 'processed_wood',
        stackable = true,
        maxStack = 30,
        sellable = true,
        qualityTiers = true
    },
    ['maple_plank'] = {
        name = 'Maple Plank',
        description = 'Processed maple plank',
        weight = 14,
        baseValue = 9,
        category = 'processed_wood',
        stackable = true,
        maxStack = 50,
        sellable = true,
        qualityTiers = true
    },
    ['beam'] = {
        name = 'Wood Beam',
        description = 'Structural wood beam',
        weight = 30,
        baseValue = 12,
        category = 'structural',
        stackable = true,
        maxStack = 20,
        sellable = true
    },
    ['post'] = {
        name = 'Wood Post',
        description = 'Support post',
        weight = 15,
        baseValue = 6,
        category = 'structural',
        stackable = true,
        maxStack = 40,
        sellable = true
    },
    ['dowel'] = {
        name = 'Wood Dowel',
        description = 'Wooden dowel pin',
        weight = 2,
        baseValue = 1,
        category = 'component',
        stackable = true,
        maxStack = 100,
        sellable = true
    },
    ['wood_shingle'] = {
        name = 'Wood Shingle',
        description = 'Roofing shingle',
        weight = 1,
        baseValue = 0.75,
        category = 'component',
        stackable = true,
        maxStack = 200,
        sellable = true
    }
}

-- Refined Materials (Carpenter Bench)
Config.Materials.Refined = {
    ['furniture_board'] = {
        name = 'Furniture Board',
        description = 'Finely sanded board for furniture',
        weight = 10,
        baseValue = 25,
        category = 'refined',
        stackable = true,
        maxStack = 30,
        sellable = true
    },
    ['barrel_stave'] = {
        name = 'Barrel Stave',
        description = 'Curved stave for barrel making',
        weight = 8,
        baseValue = 8,
        category = 'component',
        stackable = true,
        maxStack = 50,
        sellable = true
    },
    ['wheel_spoke'] = {
        name = 'Wheel Spoke',
        description = 'Wagon wheel spoke',
        weight = 5,
        baseValue = 6,
        category = 'component',
        stackable = true,
        maxStack = 50,
        sellable = true
    },
    ['tool_handle'] = {
        name = 'Tool Handle',
        description = 'Universal tool handle',
        weight = 4,
        baseValue = 5,
        category = 'component',
        stackable = true,
        maxStack = 50,
        sellable = true
    },
    ['gun_stock_blank'] = {
        name = 'Gun Stock Blank',
        description = 'Rough gun stock, needs finishing',
        weight = 8,
        baseValue = 30,
        category = 'refined',
        stackable = true,
        maxStack = 10,
        sellable = true
    },
    ['instrument_wood'] = {
        name = 'Instrument Wood',
        description = 'Premium aged wood for instruments',
        weight = 6,
        baseValue = 80,
        category = 'refined',
        stackable = true,
        maxStack = 10,
        sellable = true
    }
}

-- Byproducts & Secondary Materials
Config.Materials.Byproducts = {
    ['sawdust'] = {
        name = 'Sawdust',
        description = 'Wood sawdust, useful for various applications',
        weight = 1,
        baseValue = 0.10,
        category = 'byproduct',
        stackable = true,
        maxStack = 200,
        sellable = true,
        autoGenerate = true -- Generated automatically during sawmill operations
    },
    ['wood_chips'] = {
        name = 'Wood Chips',
        description = 'Small wood chips',
        weight = 2,
        baseValue = 0.20,
        category = 'byproduct',
        stackable = true,
        maxStack = 200,
        sellable = true,
        autoGenerate = true
    },
    ['charcoal'] = {
        name = 'Charcoal',
        description = 'Processed charcoal',
        weight = 4,
        baseValue = 2,
        category = 'processed',
        stackable = true,
        maxStack = 100,
        sellable = true
    },
    ['refined_resin'] = {
        name = 'Refined Resin',
        description = 'Purified tree resin',
        weight = 3,
        baseValue = 4,
        category = 'processed',
        stackable = true,
        maxStack = 50,
        sellable = true
    },
    ['turpentine'] = {
        name = 'Turpentine',
        description = 'Distilled turpentine',
        weight = 5,
        baseValue = 6,
        category = 'processed',
        stackable = true,
        maxStack = 30,
        sellable = true
    },
    ['wood_tar'] = {
        name = 'Wood Tar',
        description = 'Thick wood tar',
        weight = 6,
        baseValue = 5,
        category = 'processed',
        stackable = true,
        maxStack = 30,
        sellable = true
    },
    ['pitch'] = {
        name = 'Pitch',
        description = 'Waterproofing pitch',
        weight = 7,
        baseValue = 8,
        category = 'processed',
        stackable = true,
        maxStack = 30,
        sellable = true
    },
    ['varnish'] = {
        name = 'Wood Varnish',
        description = 'Protective wood varnish',
        weight = 4,
        baseValue = 10,
        category = 'processed',
        stackable = true,
        maxStack = 20,
        sellable = true
    }
}

-- Quality Tiers for Aged Materials
Config.Materials.QualityTiers = {
    ['fresh'] = {
        name = 'Fresh',
        priceMultiplier = 1.0,
        durabilityMultiplier = 0.8,
        color = '^7' -- White
    },
    ['dried'] = {
        name = 'Dried',
        priceMultiplier = 1.2,
        durabilityMultiplier = 1.0,
        agingTime = 21600, -- 6 hours in seconds
        color = '^2' -- Green
    },
    ['seasoned'] = {
        name = 'Seasoned',
        priceMultiplier = 1.5,
        durabilityMultiplier = 1.3,
        agingTime = 86400, -- 24 hours
        color = '^3' -- Yellow
    },
    ['aged'] = {
        name = 'Aged',
        priceMultiplier = 2.0,
        durabilityMultiplier = 1.6,
        agingTime = 259200, -- 72 hours
        color = '^6' -- Purple
    }
}

-- Material Categories for Organization
Config.Materials.Categories = {
    'raw_wood',
    'processed_wood',
    'structural',
    'component',
    'refined',
    'byproduct',
    'processed'
}
