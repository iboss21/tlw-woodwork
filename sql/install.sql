-- LXR-Woodwork Database Schema

-- Businesses table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_businesses` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `owner_identifier` VARCHAR(50) NOT NULL,
    `license_type` ENUM('solo', 'small', 'enterprise') NOT NULL DEFAULT 'solo',
    `business_name` VARCHAR(100) NOT NULL,
    `bank_balance` DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    `reputation` INT NOT NULL DEFAULT 0,
    `total_revenue` DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    `total_expenses` DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_active` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `abandoned` TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `owner_identifier` (`owner_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Camps table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_camps` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `business_id` INT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `center_x` FLOAT NOT NULL,
    `center_y` FLOAT NOT NULL,
    `center_z` FLOAT NOT NULL,
    `radius` FLOAT NOT NULL DEFAULT 50.0,
    `level` INT NOT NULL DEFAULT 1,
    `production_total` INT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `business_id` (`business_id`),
    FOREIGN KEY (`business_id`) REFERENCES `lxr_woodwork_businesses`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Camp structures table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_structures` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `camp_id` INT NOT NULL,
    `structure_type` VARCHAR(50) NOT NULL,
    `coords_x` FLOAT NOT NULL,
    `coords_y` FLOAT NOT NULL,
    `coords_z` FLOAT NOT NULL,
    `rotation` FLOAT NOT NULL DEFAULT 0.0,
    `tier` INT NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `camp_id` (`camp_id`),
    FOREIGN KEY (`camp_id`) REFERENCES `lxr_woodwork_camps`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Player skills table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_skills` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `player_identifier` VARCHAR(50) NOT NULL,
    `felling` INT NOT NULL DEFAULT 0,
    `felling_xp` INT NOT NULL DEFAULT 0,
    `milling` INT NOT NULL DEFAULT 0,
    `milling_xp` INT NOT NULL DEFAULT 0,
    `carpentry` INT NOT NULL DEFAULT 0,
    `carpentry_xp` INT NOT NULL DEFAULT 0,
    `logistics` INT NOT NULL DEFAULT 0,
    `logistics_xp` INT NOT NULL DEFAULT 0,
    `management` INT NOT NULL DEFAULT 0,
    `management_xp` INT NOT NULL DEFAULT 0,
    `total_trees_cut` INT NOT NULL DEFAULT 0,
    `total_planks_made` INT NOT NULL DEFAULT 0,
    `total_deliveries` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `player_identifier` (`player_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inventory table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_inventory` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `owner_type` ENUM('player', 'business', 'camp') NOT NULL,
    `owner_id` VARCHAR(50) NOT NULL,
    `item_name` VARCHAR(100) NOT NULL,
    `amount` INT NOT NULL DEFAULT 0,
    `quality` ENUM('fresh', 'dried', 'seasoned', 'aged') DEFAULT 'fresh',
    `metadata` TEXT,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `owner` (`owner_type`, `owner_id`),
    KEY `item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Employees table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_employees` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `business_id` INT NOT NULL,
    `player_identifier` VARCHAR(50) NOT NULL,
    `role` ENUM('logger', 'miller', 'driver', 'foreman') NOT NULL,
    `wage` DECIMAL(10,2) NOT NULL DEFAULT 10.00,
    `hired_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `performance_rating` INT NOT NULL DEFAULT 50,
    `hours_worked` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    `total_earned` DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`id`),
    KEY `business_id` (`business_id`),
    KEY `player_identifier` (`player_identifier`),
    FOREIGN KEY (`business_id`) REFERENCES `lxr_woodwork_businesses`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- NPCs table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_npcs` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `camp_id` INT NOT NULL,
    `npc_type` VARCHAR(50) NOT NULL,
    `coords_x` FLOAT NOT NULL,
    `coords_y` FLOAT NOT NULL,
    `coords_z` FLOAT NOT NULL,
    `heading` FLOAT NOT NULL DEFAULT 0.0,
    `model` VARCHAR(50) NOT NULL,
    `wage` DECIMAL(10,2) NOT NULL DEFAULT 10.00,
    `efficiency` DECIMAL(5,2) NOT NULL DEFAULT 1.00,
    `morale` INT NOT NULL DEFAULT 50,
    `hired_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `camp_id` (`camp_id`),
    FOREIGN KEY (`camp_id`) REFERENCES `lxr_woodwork_camps`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Trees table (track tree states)
CREATE TABLE IF NOT EXISTS `lxr_woodwork_trees` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `tree_type` VARCHAR(50) NOT NULL,
    `coords_x` FLOAT NOT NULL,
    `coords_y` FLOAT NOT NULL,
    `coords_z` FLOAT NOT NULL,
    `zone` VARCHAR(50) NOT NULL,
    `state` ENUM('healthy', 'marked', 'falling', 'fallen', 'stump', 'respawning') NOT NULL DEFAULT 'healthy',
    `health` INT NOT NULL DEFAULT 100,
    `last_harvested_by` VARCHAR(50),
    `last_harvested_at` TIMESTAMP NULL,
    `respawn_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `state` (`state`),
    KEY `zone` (`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Missions/Contracts table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_missions` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `player_identifier` VARCHAR(50) NOT NULL,
    `mission_type` VARCHAR(50) NOT NULL,
    `mission_name` VARCHAR(200) NOT NULL,
    `requirements` TEXT NOT NULL,
    `destination_x` FLOAT NOT NULL,
    `destination_y` FLOAT NOT NULL,
    `destination_z` FLOAT NOT NULL,
    `reward_money` DECIMAL(10,2) NOT NULL,
    `reward_xp` INT NOT NULL,
    `status` ENUM('active', 'completed', 'failed', 'cancelled') NOT NULL DEFAULT 'active',
    `accepted_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `expires_at` TIMESTAMP NULL,
    `completed_at` TIMESTAMP NULL,
    PRIMARY KEY (`id`),
    KEY `player_identifier` (`player_identifier`),
    KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Market prices table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_market` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `material_name` VARCHAR(100) NOT NULL,
    `base_price` DECIMAL(10,2) NOT NULL,
    `current_price` DECIMAL(10,2) NOT NULL,
    `supply_level` INT NOT NULL DEFAULT 50,
    `demand_level` INT NOT NULL DEFAULT 50,
    `last_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `material_name` (`material_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Market history table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_market_history` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `material_name` VARCHAR(100) NOT NULL,
    `price` DECIMAL(10,2) NOT NULL,
    `supply_level` INT NOT NULL,
    `demand_level` INT NOT NULL,
    `recorded_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `material_name` (`material_name`),
    KEY `recorded_at` (`recorded_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Aging items table (drying shed)
CREATE TABLE IF NOT EXISTS `lxr_woodwork_aging` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `camp_id` INT NOT NULL,
    `item_name` VARCHAR(100) NOT NULL,
    `amount` INT NOT NULL,
    `current_quality` ENUM('fresh', 'dried', 'seasoned', 'aged') NOT NULL DEFAULT 'fresh',
    `started_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `next_upgrade_at` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`),
    KEY `camp_id` (`camp_id`),
    FOREIGN KEY (`camp_id`) REFERENCES `lxr_woodwork_camps`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Transactions table (business accounting)
CREATE TABLE IF NOT EXISTS `lxr_woodwork_transactions` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `business_id` INT NOT NULL,
    `transaction_type` ENUM('income', 'expense') NOT NULL,
    `amount` DECIMAL(15,2) NOT NULL,
    `description` VARCHAR(200) NOT NULL,
    `category` VARCHAR(50),
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `business_id` (`business_id`),
    FOREIGN KEY (`business_id`) REFERENCES `lxr_woodwork_businesses`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Vehicles table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_vehicles` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `owner_identifier` VARCHAR(50) NOT NULL,
    `vehicle_type` VARCHAR(50) NOT NULL,
    `durability` INT NOT NULL DEFAULT 100,
    `coords_x` FLOAT,
    `coords_y` FLOAT,
    `coords_z` FLOAT,
    `heading` FLOAT,
    `cargo` TEXT,
    `purchased_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `owner_identifier` (`owner_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tool durability table
CREATE TABLE IF NOT EXISTS `lxr_woodwork_tools` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `owner_identifier` VARCHAR(50) NOT NULL,
    `tool_type` VARCHAR(50) NOT NULL,
    `durability` INT NOT NULL DEFAULT 100,
    `max_durability` INT NOT NULL DEFAULT 100,
    `metadata` TEXT,
    `acquired_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `owner_identifier` (`owner_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
