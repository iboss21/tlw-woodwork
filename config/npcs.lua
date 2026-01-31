Config.NPCs = Config.NPCs or {}

-- Hireable NPC Types
Config.NPCs.Types = {
    camp_manager = {
        name = 'Camp Manager',
        description = 'Handles sales when owner is offline',
        model = 'u_m_m_blwlumberjack_01',
        dailyCost = 20,
        requiredLicense = 'small',
        placement = 'main_office',
        features = {
            handleSales = true,
            manageInventory = true,
            acceptContracts = false,
            workOffline = true
        },
        efficiency = 0.8, -- 80% of player efficiency
        maxPerCamp = 1
    },
    sawmill_operator = {
        name = 'Sawmill Operator',
        description = 'Automatically processes queued logs',
        model = 'u_m_m_blwlumberjack_01',
        dailyCost = 15,
        requiredLicense = 'small',
        placement = 'sawmill',
        features = {
            autoProcess = true,
            queueManagement = true,
            qualityControl = false
        },
        efficiency = 0.7,
        maxPerCamp = 2
    },
    stock_handler = {
        name = 'Stock Handler',
        description = 'Organizes storage and tracks inventory',
        model = 'u_m_m_blwlumberjack_01',
        dailyCost = 10,
        requiredLicense = 'small',
        placement = 'storage_barn',
        features = {
            organizeStorage = true,
            trackInventory = true,
            alertLowStock = true
        },
        efficiency = 1.0, -- Organization doesn't affect speed
        maxPerCamp = 1
    },
    guard = {
        name = 'Camp Guard',
        description = 'Defends camp from NPC bandits',
        model = 'u_m_m_bwmsheriff_01',
        dailyCost = 25,
        requiredLicense = 'small',
        placement = 'perimeter',
        features = {
            defendCamp = true,
            patrol = true,
            alertOwner = true
        },
        combatSkill = 50,
        maxPerCamp = 4
    },
    stable_hand = {
        name = 'Stable Hand',
        description = 'Maintains horses and repairs carts',
        model = 'u_m_m_blwlumberjack_01',
        dailyCost = 12,
        requiredLicense = 'small',
        placement = 'stables',
        features = {
            horseCare = true,
            vehicleRepair = true,
            feedAnimals = true
        },
        efficiency = 0.75,
        maxPerCamp = 1
    }
}

-- NPC Appearance Customization
Config.NPCs.Customization = {
    enabled = true,
    options = {
        gender = {'male', 'female'},
        models = {
            male = {
                'u_m_m_blwlumberjack_01',
                'u_m_m_nbxworker_01',
                'u_m_m_bwmworker_01'
            },
            female = {
                'u_f_m_tumgeneralstoreowner_01',
                'u_f_m_rhdgeneralstoreowner_01'
            }
        },
        clothing = {
            'worker_outfit',
            'casual_outfit',
            'formal_outfit'
        }
    }
}

-- NPC AI Behavior
Config.NPCs.Behavior = {
    workSchedule = {
        enabled = true,
        defaultShift = {start = 6, ['end'] = 22}, -- 6 AM to 10 PM
        breakTime = {duration = 30, frequency = 240}, -- 30 min break every 4 hours
        nightShift = {enabled = true, payMultiplier = 1.2}
    },
    automation = {
        campManager = {
            checkInventory = 300, -- Every 5 minutes
            acceptSales = true,
            restockThreshold = 10 -- Restock when below 10 items
        },
        sawmillOperator = {
            checkQueue = 60, -- Every minute
            autoStart = true,
            prioritySystem = true -- Process high-value items first
        },
        guard = {
            patrolRadius = 50.0,
            patrolSpeed = 'walk',
            alertRadius = 30.0,
            engageThreats = true
        }
    },
    idle = {
        animations = {
            'idle_smoke',
            'idle_lean',
            'idle_stretch',
            'idle_talk'
        },
        wanderRadius = 10.0
    }
}

-- NPC Performance Tracking
Config.NPCs.Performance = {
    trackMetrics = true,
    metrics = {
        itemsProcessed = true,
        salesCompleted = true,
        threatsDefeated = true,
        hoursWorked = true,
        efficiency = true
    },
    bonuses = {
        highPerformance = {threshold = 90, bonus = 1.15}, -- 15% bonus
        averagePerformance = {threshold = 70, bonus = 1.0},
        lowPerformance = {threshold = 50, bonus = 0.85} -- 15% penalty
    }
}

-- NPC Wages System
Config.NPCs.Wages = {
    minimumWage = 5, -- $ per hour
    maximumWage = 50,
    defaultWage = 10,
    paymentSchedule = 'daily', -- 'hourly', 'daily', 'weekly'
    overtimePay = 1.5, -- 1.5x for overtime
    bonusSystem = {
        enabled = true,
        performanceBonus = 0.20, -- Up to 20% bonus
        loyaltyBonus = 0.10 -- 10% bonus after 30 days
    }
}

-- NPC Placement System
Config.NPCs.Placement = {
    useGizmo = true,
    validLocations = {
        camp_manager = {'main_office'},
        sawmill_operator = {'sawmill'},
        stock_handler = {'storage_barn'},
        guard = {'perimeter', 'gate', 'main_office'},
        stable_hand = {'stables'}
    },
    snapToPoints = true,
    showPreview = true
}

-- NPC Morale System
Config.NPCs.Morale = {
    enabled = true,
    factors = {
        wages = {
            low = -10, -- Below minimum
            fair = 0, -- Minimum to average
            good = 5, -- Above average
            excellent = 10 -- Maximum
        },
        workingConditions = {
            poor = -5,
            average = 0,
            good = 5
        },
        treatment = {
            harsh = -10,
            neutral = 0,
            kind = 5
        }
    },
    effects = {
        [80] = {efficiency = 1.2}, -- High morale
        [60] = {efficiency = 1.1},
        [40] = {efficiency = 1.0},
        [20] = {efficiency = 0.8}, -- Low morale
        [0] = {efficiency = 0.5, quitChance = 50} -- May quit
    }
}

-- NPC Dialog
Config.NPCs.Dialog = {
    greetings = {
        'Howdy, boss!',
        'Good to see you!',
        'What can I do for you?',
        'Everything\'s running smooth!'
    },
    complaints = {
        lowWage = 'These wages ain\'t fair...',
        overworked = 'I need a break, boss.',
        poorConditions = 'This place needs work.'
    },
    requests = {
        raise = 'Could we talk about a raise?',
        break = 'Mind if I take a break?',
        supplies = 'We\'re running low on supplies.'
    }
}

-- NPC Termination
Config.NPCs.Termination = {
    noticeRequired = true,
    noticePeriod = 86400, -- 24 hours
    severancePay = {
        enabled = true,
        calculation = 'days_worked * daily_wage * 0.5'
    },
    reasons = {
        performance = 'Poor performance',
        budget = 'Budget cuts',
        restructure = 'Business restructure',
        voluntary = 'Voluntary resignation'
    }
}

-- NPC Spawn Locations
Config.NPCs.SpawnLocations = {
    workerPool = {
        coords = vector3(-175.0, 625.0, 114.0), -- Valentine
        radius = 10.0,
        availableCount = 20 -- Number of NPCs in pool
    }
}
