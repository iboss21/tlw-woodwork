Locale = {}

Locale['en'] = {
    -- General
    ['resource_name'] = 'LXR-Woodwork',
    ['press_to_interact'] = 'Press ~INPUT_CONTEXT~ to %s',
    ['not_enough_money'] = 'You don\'t have enough money',
    ['not_enough_skill'] = 'Your skill level is too low',
    ['inventory_full'] = 'Your inventory is full',
    ['too_far_away'] = 'You are too far away',
    
    -- Trees
    ['chop_tree'] = 'Chop Tree',
    ['delimb_tree'] = 'Delimb Tree',
    ['buck_tree'] = 'Buck Tree',
    ['extract_sap'] = 'Extract Sap',
    ['tree_health'] = 'Tree Health: %s%%',
    ['tree_chopping'] = 'Chopping tree...',
    ['tree_fell'] = 'Tree has been felled!',
    ['tree_processing'] = 'Processing tree...',
    ['requires_two_players'] = 'This tree requires two players to fell',
    ['waiting_for_partner'] = 'Waiting for a partner...',
    ['tree_too_difficult'] = 'This tree is too difficult for your skill level',
    ['not_enough_stamina'] = 'You don\'t have enough stamina',
    
    -- Materials
    ['received_material'] = 'Received %sx %s',
    ['material_quality'] = 'Quality: %s',
    ['material_weight'] = 'Weight: %s',
    
    -- Tools
    ['tool_broken'] = 'Your %s is broken!',
    ['tool_damaged'] = 'Your %s is damaged (%s%% durability)',
    ['tool_repaired'] = 'Tool repaired successfully',
    ['no_repair_materials'] = 'You don\'t have the materials to repair this tool',
    ['tool_equipped'] = 'Equipped %s',
    
    -- Processing
    ['processing_started'] = 'Processing started',
    ['processing_complete'] = 'Processing complete!',
    ['processing_failed'] = 'Processing failed',
    ['no_materials'] = 'You don\'t have the required materials',
    ['station_busy'] = 'This station is currently busy',
    ['place_in_shed'] = 'Place in Drying Shed',
    ['aging_started'] = 'Aging process started',
    ['item_upgraded'] = 'Item quality upgraded to %s',
    
    -- Business
    ['purchase_license'] = 'Purchase License',
    ['license_purchased'] = 'License purchased successfully!',
    ['business_created'] = 'Business created successfully!',
    ['business_name'] = 'Business Name',
    ['manage_business'] = 'Manage Business',
    ['business_bank'] = 'Business Bank: %s',
    ['daily_costs'] = 'Daily Costs: %s',
    ['total_employees'] = 'Employees: %s/%s',
    ['cant_afford_license'] = 'You can\'t afford this license',
    ['already_own_business'] = 'You already own a business',
    
    -- Camp
    ['enter_build_mode'] = 'Enter Build Mode',
    ['exit_build_mode'] = 'Exit Build Mode',
    ['place_structure'] = 'Place Structure',
    ['rotate_structure'] = 'Rotate: ~INPUT_MOVE_LR~',
    ['confirm_placement'] = 'Confirm: ~INPUT_CONTEXT~',
    ['cancel_placement'] = 'Cancel: ~INPUT_CANCEL~',
    ['structure_placed'] = 'Structure placed successfully!',
    ['cant_place_here'] = 'You can\'t place a structure here',
    ['too_close_to_structure'] = 'Too close to another structure',
    ['outside_camp_radius'] = 'Outside of camp radius',
    ['terrain_not_suitable'] = 'Terrain is not suitable',
    ['pack_up_camp'] = 'Pack Up Camp',
    ['confirm_pack_up'] = 'Are you sure you want to pack up this camp?',
    ['camp_packed_up'] = 'Camp packed up successfully',
    ['pack_up_cooldown'] = 'You must wait before packing up',
    
    -- Employees
    ['hire_employee'] = 'Hire Employee',
    ['fire_employee'] = 'Fire Employee',
    ['set_wage'] = 'Set Wage',
    ['employee_hired'] = '%s hired successfully!',
    ['employee_fired'] = '%s fired',
    ['wage_updated'] = 'Wage updated to %s/hour',
    ['cant_afford_wage'] = 'Business can\'t afford this wage',
    ['max_employees'] = 'You\'ve reached the maximum number of employees',
    ['not_owner'] = 'You are not the owner of this business',
    ['no_permission'] = 'You don\'t have permission to do that',
    
    -- NPCs
    ['hire_npc'] = 'Hire NPC',
    ['fire_npc'] = 'Fire NPC',
    ['npc_hired'] = 'NPC hired successfully!',
    ['npc_fired'] = 'NPC fired',
    ['npc_working'] = 'Working...',
    ['npc_idle'] = 'Idle',
    ['npc_on_break'] = 'On Break',
    
    -- Vehicles
    ['purchase_vehicle'] = 'Purchase Vehicle',
    ['vehicle_purchased'] = 'Vehicle purchased!',
    ['load_cargo'] = 'Load Cargo',
    ['unload_cargo'] = 'Unload Cargo',
    ['cargo_loaded'] = 'Loaded %sx %s',
    ['cargo_unloaded'] = 'Unloaded cargo',
    ['vehicle_full'] = 'Vehicle is full',
    ['vehicle_empty'] = 'Vehicle is empty',
    ['vehicle_overloaded'] = 'Vehicle is overloaded!',
    ['vehicle_damaged'] = 'Vehicle is damaged',
    ['repair_vehicle'] = 'Repair Vehicle',
    
    -- Missions
    ['accept_mission'] = 'Accept Mission',
    ['cancel_mission'] = 'Cancel Mission',
    ['mission_accepted'] = 'Mission accepted!',
    ['mission_cancelled'] = 'Mission cancelled',
    ['mission_completed'] = 'Mission completed! Reward: %s',
    ['mission_failed'] = 'Mission failed',
    ['mission_expired'] = 'Mission expired',
    ['deliver_cargo'] = 'Deliver Cargo',
    ['mission_progress'] = 'Progress: %s/%s',
    ['time_remaining'] = 'Time Remaining: %s',
    
    -- Skills
    ['skill_increased'] = '%s skill increased to level %s!',
    ['level_up'] = 'Level Up!',
    ['xp_gained'] = '+%s XP',
    ['skill_title'] = 'Title: %s',
    ['view_skills'] = 'View Skills',
    ['unlock_available'] = 'New unlock available!',
    
    -- Shops
    ['open_shop'] = 'Open Shop',
    ['buy_item'] = 'Buy',
    ['sell_item'] = 'Sell',
    ['item_purchased'] = 'Purchased %sx %s for %s',
    ['item_sold'] = 'Sold %sx %s for %s',
    ['out_of_stock'] = 'Out of stock',
    ['market_prices'] = 'Market Prices',
    
    -- UI
    ['confirm'] = 'Confirm',
    ['cancel'] = 'Cancel',
    ['close'] = 'Close',
    ['back'] = 'Back',
    ['next'] = 'Next',
    ['previous'] = 'Previous',
    ['amount'] = 'Amount',
    ['total'] = 'Total',
    ['balance'] = 'Balance',
    
    -- Notifications
    ['success'] = 'Success',
    ['error'] = 'Error',
    ['warning'] = 'Warning',
    ['info'] = 'Info'
}

return Locale
