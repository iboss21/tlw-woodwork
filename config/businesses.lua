Config.Businesses = Config.Businesses or {}

-- Business License Tiers
Config.Businesses.LicenseTiers = {
    solo = {
        name = 'Solo Operator',
        cost = 5000,
        maxEmployees = 0,
        maxCamps = 1,
        maxStructures = 5,
        requiredLevel = 0,
        features = {
            personalUse = true,
            businessBank = false,
            employeeHiring = false,
            customPricing = false,
            analytics = false,
            multipleLocations = false
        }
    },
    small = {
        name = 'Small Business',
        cost = 25000,
        maxEmployees = 5,
        maxCamps = 1,
        maxStructures = 15,
        requiredLevel = 20,
        features = {
            personalUse = true,
            businessBank = true,
            employeeHiring = true,
            customPricing = true,
            analytics = 'basic',
            multipleLocations = false
        }
    },
    enterprise = {
        name = 'Enterprise',
        cost = 100000,
        maxEmployees = -1, -- Unlimited
        maxCamps = 5,
        maxStructures = 50,
        requiredLevel = 50,
        features = {
            personalUse = true,
            businessBank = true,
            employeeHiring = true,
            customPricing = true,
            analytics = 'advanced',
            multipleLocations = true,
            priorityShipping = true,
            customContracts = true
        }
    }
}

-- Business Management
Config.Businesses.Management = {
    dailyOperatingCosts = {
        solo = 10,
        small = 50,
        enterprise = 200
    },
    taxRate = 0.05, -- 5% tax on profits
    minimumWage = 5, -- Minimum $ per hour for employees
    maximumWage = 100,
    bankAccountInterest = 0.01, -- 1% daily interest on positive balance
    debtInterest = 0.05, -- 5% daily interest on negative balance
    inactivityGracePeriod = 604800, -- 7 days before abandonment warning
    abandonmentTime = 2592000 -- 30 days total
}

-- Business Analytics
Config.Businesses.Analytics = {
    basic = {
        totalRevenue = true,
        totalExpenses = true,
        netProfit = true,
        employeeCount = true,
        productionVolume = true
    },
    advanced = {
        revenueByProduct = true,
        expenseBreakdown = true,
        employeePerformance = true,
        hourlyProductivity = true,
        marketComparison = true,
        profitPredictions = true,
        inventoryTurnover = true
    }
}

-- Business Upgrades
Config.Businesses.Upgrades = {
    ['storage_expansion'] = {
        name = 'Storage Expansion',
        description = 'Increase storage capacity by 50%',
        cost = 5000,
        requiredLevel = 25,
        effects = {
            storageMultiplier = 1.5
        }
    },
    ['production_efficiency'] = {
        name = 'Production Efficiency',
        description = 'Increase processing speed by 20%',
        cost = 10000,
        requiredLevel = 35,
        effects = {
            processingSpeedMultiplier = 1.2
        }
    },
    ['quality_control'] = {
        name = 'Quality Control',
        description = 'Increase product quality by 15%',
        cost = 15000,
        requiredLevel = 45,
        effects = {
            qualityMultiplier = 1.15
        }
    },
    ['automated_systems'] = {
        name = 'Automated Systems',
        description = 'NPCs work 25% faster',
        cost = 25000,
        requiredLevel = 60,
        effects = {
            npcSpeedMultiplier = 1.25
        }
    },
    ['premium_branding'] = {
        name = 'Premium Branding',
        description = 'Sell products for 30% more',
        cost = 50000,
        requiredLevel = 75,
        effects = {
            sellPriceMultiplier = 1.3
        }
    }
}

-- Business Bank Account
Config.Businesses.Banking = {
    initialBalance = 0,
    maxBalance = 1000000,
    minBalance = -10000, -- Can go into debt up to $10,000
    transactionFee = 0, -- No fees for deposits/withdrawals
    bankruptcyThreshold = -15000,
    bankruptcyPenalty = 0.5 -- Lose 50% of assets
}

-- Public Operations (Server-Owned)
Config.Businesses.PublicOperations = {
    enabled = true,
    locations = {
        {
            name = 'State Lumber Camp - Tall Trees',
            coords = vector3(-1800.0, -1600.0, 150.0),
            payoutMultiplier = 0.7, -- 70% of normal payout
            openToAll = true,
            structures = {
                'main_office',
                'sawmill',
                'storage_barn'
            }
        },
        {
            name = 'State Lumber Camp - Big Valley',
            coords = vector3(-1300.0, 400.0, 120.0),
            payoutMultiplier = 0.7,
            openToAll = true,
            structures = {
                'main_office',
                'sawmill',
                'storage_barn'
            }
        }
    }
}

-- Camp Layout Customization
Config.Businesses.CampCustomization = {
    structureRotation = true,
    structureMoving = true, -- Can relocate structures within camp
    moveCooldown = 3600, -- 1 hour cooldown after moving
    decorativePlaceables = {
        'fence',
        'lantern_post',
        'barrel',
        'crate',
        'sign',
        'flag'
    }
}

-- Business Permissions
Config.Businesses.Permissions = {
    owner = {
        hire = true,
        fire = true,
        setWages = true,
        setSchedules = true,
        accessBank = true,
        viewAnalytics = true,
        customizeLayout = true,
        setPrices = true,
        packUp = true
    },
    foreman = {
        hire = false,
        fire = false,
        setWages = false,
        setSchedules = true,
        accessBank = false,
        viewAnalytics = true,
        customizeLayout = false,
        setPrices = false,
        packUp = false,
        manageEmployees = true
    },
    employee = {
        hire = false,
        fire = false,
        setWages = false,
        setSchedules = false,
        accessBank = false,
        viewAnalytics = false,
        customizeLayout = false,
        setPrices = false,
        packUp = false,
        workAtStations = true
    }
}

-- Pack Up System
Config.Businesses.PackUp = {
    cooldown = 3600, -- 1 hour cooldown
    refundPercentage = 0.75, -- Get 75% of structure costs back
    packUpTime = 300, -- 5 minutes to pack up
    requiresOwner = true,
    warningTime = 60 -- 60 second warning before pack up
}
