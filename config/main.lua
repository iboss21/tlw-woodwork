Config = Config or {}

-- Framework Detection
Config.FrameworkPriority = {'lxr-core', 'rsg-core', 'qb-core', 'esx', 'standalone'}
Config.Framework = 'auto' -- Will auto-detect based on priority

-- System Integrations
Config.InventorySystem = 'auto' -- 'ox_inventory', 'lxr-inventory', 'rsg-inventory', 'qb-inventory', 'standalone'
Config.BankingSystem = 'auto' -- 'lxr-banking', 'rsg-banking', 'qb-banking', 'esx_addonaccount', 'standalone'
Config.HousingSystem = 'auto' -- 'lxr-housing', 'rsg-housing', 'bcs_housing', 'none'
Config.JobSystem = 'auto' -- 'lxr-jobs', 'rsg-jobs', framework default
Config.TargetSystem = 'auto' -- 'ox_target', 'rsg-target', 'qb-target', 'drawtext'

-- General Settings
Config.UseTarget = true -- Use target system for interactions
Config.InteractionDistance = 3.0 -- Distance for drawtext interactions
Config.Debug = false -- Enable debug prints

-- Database Settings
Config.UseOxMySQL = true -- Use oxmysql (recommended)

-- Business Settings
Config.MaxBusinessesPerPlayer = 3
Config.BusinessInactivityDays = 30 -- Days before camp abandonment
Config.PackUpCooldown = 3600 -- Seconds before can pack up and relocate (1 hour)

-- Camp Settings
Config.MaxCampRadius = 50.0 -- Maximum camp size from center point
Config.MinStructureSpacing = 2.0 -- Minimum distance between structures
Config.CampRenderDistance = 100.0 -- Distance to load camp structures
Config.RequireRoadProximity = true -- Camps must be near roads
Config.MaxRoadDistance = 50.0 -- Maximum distance from road

-- Tree Settings
Config.TreeRespawnType = 'timer' -- 'timer', 'per_player', 'server_restart'
Config.GlobalTreeLimit = 1000 -- Maximum trees on server
Config.TreeStateSync = 5000 -- Sync tree states every 5 seconds

-- Physics Settings
Config.TreeFallingSpeed = 1.0 -- Multiplier for falling animation speed
Config.TreeFallingDamage = 20 -- Damage dealt by falling tree
Config.TreeCollisionEnabled = true -- Enable collision detection for falling trees

-- Economy Settings
Config.EnableDynamicPricing = true -- Enable supply/demand pricing
Config.PriceUpdateInterval = 3600 -- Update prices every hour (in seconds)
Config.MaxPriceFluctuation = 0.5 -- Maximum 50% price change from base

-- Skill Settings
Config.SkillXPMultiplier = 1.0 -- Global XP multiplier
Config.MaxSkillLevel = 100
Config.SkillLossOnDeath = false -- Lose XP on death

-- Mission Settings
Config.MaxActiveMissions = 5 -- Maximum active contracts per player
Config.MissionCooldown = 300 -- Cooldown between mission completions (seconds)

-- Multiplayer Settings
Config.EnableMultiplayerFelling = true -- Allow two-person tree cutting
Config.EnableConvoys = true -- Allow multiplayer convoys
Config.MaxConvoySize = 6 -- Maximum players in convoy

-- Performance Settings
Config.MaxCampsRendered = 10 -- Maximum camps rendered at once
Config.StructureStreamingDistance = 150.0
Config.UpdateInterval = 1000 -- General update tick (ms)

-- PvP Settings (Open Questions Resolution)
Config.EnableCampRaiding = false -- Can players steal from other camps
Config.CampProtectionEnabled = true -- Protected camps cant be raided

-- Weather Integration
Config.WeatherAffectsWork = true -- Weather affects work speed
Config.WeatherScript = 'auto' -- Auto-detect weather script

-- Map Blips
Config.ShowAllCamps = false -- Show all camps on map
Config.ShowOwnedCamps = true -- Show owned camps
Config.ShowPublicOperations = true -- Show public server-owned operations
Config.DiscoverableCamps = true -- Camps appear when nearby

-- Offline Income
Config.OfflineIncome = true -- NPCs work while owner offline
Config.OfflineIncomeRate = 0.5 -- 50% production rate when offline
Config.MaxOfflineTime = 86400 -- Maximum offline income time (24 hours)

-- Bankruptcy Mechanics
Config.EnableBankruptcy = true
Config.NegativeBalanceLimit = -1000 -- Maximum debt before bankruptcy
Config.BankruptcyPenalty = 0.5 -- Lose 50% of assets on bankruptcy

-- Notification System
Config.NotificationType = 'auto' -- 'auto', 'chat', 'mythic_notify', 'okokNotify'

-- Locale
Config.Locale = 'en' -- 'en', 'ge' (Georgian)
