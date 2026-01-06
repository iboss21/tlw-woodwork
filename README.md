# LXR-Woodwork

Full-scale woodworking industry simulation for RedM with purchasable businesses, deployable lumber camps, multiplayer operations, dynamic tree felling physics, cross-region shipping logistics, and comprehensive material processing chain.

## Features

### Business Ownership System
- **Three License Tiers:**
  - Solo Operator ($5,000) - Personal use only
  - Small Business ($25,000) - Up to 5 employees
  - Enterprise ($100,000) - Unlimited employees, multiple camps

- **Owner Capabilities:**
  - Set employee wages and schedules
  - Access business bank account
  - View production analytics
  - Customize camp layout
  - Set product prices

### Deployable Lumber Camp System
- **Gizmo-Based Placement:** 3D build mode with grid snapping
- **Placeable Structures:**
  - Core: Main Office, Sawmill, Drying Shed, Storage Barn, Worker Quarters, Stables
  - Production: Sap Station, Kiln, Carpenter Bench, Tool Repair, Pitch Boiler
  - Utility: Water Trough, Hitching Posts, Fencing, Gates, Lanterns, Fire Pits
- **Placement Rules:** Terrain validation, structure spacing, camp radius limits

### Tree System & Harvesting
- **7 Tree Types:** Pine, Oak, Cedar, Birch, Redwood, Maple, Willow
- **Dynamic Properties:** Different harvest times, log yields, sap chances, respawn times
- **Tree States:** Healthy, Marked, Falling, Fallen, Stump, Respawning
- **Felling Mechanics:** Stamina-based chopping, tool durability, skill progression
- **Physics System:** Dynamic tree falling based on player position, terrain slope, wind
- **Multiplayer Felling:** Large trees require two players with synced animations

### Material Processing Chain
- **Raw Materials:** 10+ harvestable materials from trees
- **Processed Materials:** 10+ sawmill outputs (planks, beams, posts, dowels, shingles)
- **Refined Materials:** 6+ carpenter bench products (furniture boards, gun stocks, etc.)
- **Byproducts:** 8+ secondary materials (sawdust, charcoal, resin, pitch, varnish)
- **Quality System:** Fresh → Dried → Seasoned → Aged (affects pricing and durability)

### Tools & Equipment
- **Harvesting Tools:** Hatchet, Felling Axe, Broad Axe, Two-Man Saw, Crosscut Saw
- **Processing Tools:** Hand Saw, Drawknife, Wood Plane, Chisel Set, Sandpaper
- **Durability System:** Tools degrade with use, require repair at stations
- **Performance Bonuses:** Speed multipliers, yield bonuses, quality improvements

### Transport & Logistics
- **6 Vehicle Types:** Wheelbarrow, Handcart, Horse+Drag, Small/Large/Lumber Wagons
- **Capacity System:** Different weights and volumes per vehicle
- **Loading Mechanics:** Physical cargo loading with visual stacking
- **Shipping Routes:** Local, Regional, Cross-State, Express deliveries
- **Multiplayer Convoys:** Group deliveries with shared bonuses

### Skills & Progression
- **5 Skill Categories:** Felling, Milling, Carpentry, Logistics, Management
- **100 Levels:** Progressive unlocks and bonuses
- **Title System:** Greenhorn → Logger → Sawyer → Craftsman → Foreman → Master → Legendary
- **Benefits:** Speed bonuses, yield increases, reduced costs, unlocked content

### Missions & Contracts
- **6 Contract Types:** Bulk Order, Rush Order, Quality Order, Construction, Special Request, Repeating
- **Dynamic Generation:** Auto-generated contracts based on player level and region
- **Reputation System:** Better contracts and prices with higher reputation
- **Rewards:** Money, XP, unique items, reputation points

### NPC & Economy
- **5 Hireable NPC Types:** Camp Manager, Sawmill Operator, Stock Handler, Guard, Stable Hand
- **AI Automation:** NPCs work while owner is offline (configurable)
- **8 Shop Locations:** Valentine, Saint Denis, Strawberry, Annesburg, Rhodes, Blackwater, Tumbleweed, Van Horn
- **Dynamic Pricing:** Supply and demand affect market prices
- **Shop Specialties:** Different pricing and stock per location

### Employee & Multiplayer System
- **4 Employee Roles:** Logger, Miller, Driver, Foreman
- **Wage System:** Configurable hourly/daily/weekly wages
- **Performance Tracking:** Metrics visible to business owners
- **Job Posting Board:** Players apply for open positions

## Installation

### Dependencies
- RedM Server
- oxmysql (database connector)
- Framework: lxr-core, rsg-core, qb-core, esx, or standalone

### Setup Instructions

1. **Download and Extract**
   ```
   Download the resource and place it in your server's resources folder.
   ```

2. **Database Setup**
   ```
   Execute the SQL file located at sql/install.sql in your MySQL database.
   This will create all necessary tables.
   ```

3. **Add to server.cfg**
   ```
   ensure oxmysql
   ensure lxr-woodwork
   ```

4. **Configuration**
   - Edit `config/main.lua` to configure framework, systems, and general settings
   - Adjust other config files as needed for your server

5. **Start Server**
   ```
   The resource will automatically initialize on server start.
   ```

## Configuration

### Main Settings (config/main.lua)
- Framework auto-detection priority
- System integrations (inventory, banking, housing, job, target)
- Business limits and cooldowns
- Camp settings and placement rules
- Tree respawn mechanics
- Economy settings
- Skill progression rates
- Multiplayer features
- PvP and offline income settings

### Key Configuration Options
```lua
Config.FrameworkPriority = {'lxr-core', 'rsg-core', 'qb-core', 'esx', 'standalone'}
Config.MaxBusinessesPerPlayer = 3
Config.BusinessInactivityDays = 30
Config.EnableDynamicPricing = true
Config.EnableMultiplayerFelling = true
Config.OfflineIncome = true
Config.EnableBankruptcy = true
```

## Usage

### Getting Started
1. Purchase a woodworking license from the government office (Valentine by default)
2. Select your license tier based on your goals (Solo, Small Business, or Enterprise)
3. Find a suitable location in a harvesting zone
4. Enter build mode and place your Main Office (required first structure)
5. Add additional structures like Sawmill, Storage Barn, etc.

### Harvesting Trees
1. Travel to a harvesting zone (marked on map)
2. Approach a tree and press interaction key
3. Begin chopping - manage your stamina and tool durability
4. Once felled, process the tree (delimb, buck into logs, extract sap)
5. Load logs onto your vehicle

### Processing Materials
1. Return to your camp with raw materials
2. Use the Sawmill to process logs into planks
3. Use the Carpenter Bench for refined products
4. Place planks in Drying Shed to improve quality over time
5. Use Kiln and Pitch Boiler for byproducts

### Running a Business
1. Hire employees or NPCs to automate operations
2. Accept contracts from the mission board
3. Manage your business bank account
4. Monitor production analytics
5. Set custom pricing for your products

### Deliveries
1. Load cargo onto your vehicle
2. Accept a delivery contract or deliver to shops
3. Travel to the destination
4. Unload cargo and collect payment
5. Form convoys with other players for bonus rewards

## Exports

### Client Exports
```lua
-- Get player skills
exports['lxr-woodwork']:GetPlayerSkills()

-- Get player inventory
exports['lxr-woodwork']:GetPlayerInventory()
```

### Server Exports
```lua
-- Get player skill level
exports['lxr-woodwork']:GetPlayerSkill(playerId, skillName)

-- Add material to inventory
exports['lxr-woodwork']:AddMaterial(playerId, material, amount)

-- Remove material from inventory
exports['lxr-woodwork']:RemoveMaterial(playerId, material, amount)

-- Get business data
exports['lxr-woodwork']:GetBusinessData(businessId)

-- Check if player is employee
exports['lxr-woodwork']:IsPlayerEmployee(playerId, businessId)

-- Get current market price
exports['lxr-woodwork']:GetMarketPrice(material)

-- Spawn a tree
exports['lxr-woodwork']:SpawnTree(coords, treeType)

-- Register custom delivery point
exports['lxr-woodwork']:RegisterDeliveryPoint(name, coords, acceptedMaterials)
```

## Localization

The resource supports multiple languages. Currently included:
- English (`en.lua`)
- Georgian (`ge.lua`)

To add a new language, create a new file in the `locales/` folder following the existing format.

## Support & Updates

For support, issues, or feature requests, please visit the GitHub repository.

## Credits

- **Developer:** LXR Development
- **Framework Support:** lxr-core, rsg-core, qb-core, esx
- **Database:** oxmysql
- **PRD:** The Land of Wolves - LXR-Woodwork

## License

This resource is provided for use on RedM servers. Please respect the original work and credits.

---

**Version:** 1.0.0  
**Last Updated:** 2026-01-06
