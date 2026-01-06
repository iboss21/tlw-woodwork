Locale = Locale or {}

-- Georgian (Georgia) localization
Locale['ge'] = {
    -- General
    ['resource_name'] = 'LXR-Woodwork',
    ['press_to_interact'] = 'დააჭირეთ ~INPUT_CONTEXT~ რომ %s',
    ['not_enough_money'] = 'არ გაქვთ საკმარისი ფული',
    ['not_enough_skill'] = 'თქვენი უნარის დონე ძალიან დაბალია',
    ['inventory_full'] = 'თქვენი ინვენტარი სავსეა',
    ['too_far_away'] = 'ძალიან შორს ხართ',
    
    -- Trees
    ['chop_tree'] = 'ხის მოჭრა',
    ['delimb_tree'] = 'ტოტების მოჭრა',
    ['buck_tree'] = 'ხის გაჭრა',
    ['extract_sap'] = 'წვენის მოპოვება',
    ['tree_health'] = 'ხის ჯანმრთელობა: %s%%',
    ['tree_chopping'] = 'ხის მოჭრა...',
    ['tree_fell'] = 'ხე მოჭრილია!',
    ['tree_processing'] = 'ხის დამუშავება...',
    ['requires_two_players'] = 'ამ ხის მოსაჭრელად ორი მოთამაშეა საჭირო',
    ['waiting_for_partner'] = 'პარტნიორის მოლოდინი...',
    ['tree_too_difficult'] = 'ეს ხე ძალიან რთულია თქვენი უნარის დონისთვის',
    ['not_enough_stamina'] = 'არ გაქვთ საკმარისი გამძლეობა',
    
    -- Materials
    ['received_material'] = 'მიღებულია %sx %s',
    ['material_quality'] = 'ხარისხი: %s',
    ['material_weight'] = 'წონა: %s',
    
    -- Tools
    ['tool_broken'] = 'თქვენი %s გატეხილია!',
    ['tool_damaged'] = 'თქვენი %s დაზიანებულია (%s%% გამძლეობა)',
    ['tool_repaired'] = 'ხელსაწყო წარმატებით შეკეთდა',
    ['no_repair_materials'] = 'არ გაქვთ შეკეთების მასალები',
    ['tool_equipped'] = 'აღჭურვილია %s',
    
    -- Processing
    ['processing_started'] = 'დამუშავება დაწყებულია',
    ['processing_complete'] = 'დამუშავება დასრულდა!',
    ['processing_failed'] = 'დამუშავება ვერ შედგა',
    ['no_materials'] = 'არ გაქვთ საჭირო მასალები',
    ['station_busy'] = 'ეს სადგური ამჟამად დაკავებულია',
    ['place_in_shed'] = 'მოათავსეთ საშრობში',
    ['aging_started'] = 'დაძველების პროცესი დაიწყო',
    ['item_upgraded'] = 'ნივთის ხარისხი გაუმჯობესდა %s-მდე',
    
    -- Business
    ['purchase_license'] = 'ლიცენზიის შეძენა',
    ['license_purchased'] = 'ლიცენზია წარმატებით შეძენილია!',
    ['business_created'] = 'ბიზნესი წარმატებით შეიქმნა!',
    ['business_name'] = 'ბიზნესის სახელი',
    ['manage_business'] = 'ბიზნესის მართვა',
    ['business_bank'] = 'ბიზნეს ბანკი: %s',
    ['daily_costs'] = 'დღიური ხარჯები: %s',
    ['total_employees'] = 'თანამშრომლები: %s/%s',
    ['cant_afford_license'] = 'არ შეგიძლიათ ამ ლიცენზიის შეძენა',
    ['already_own_business'] = 'თქვენ უკვე გაქვთ ბიზნესი',
    
    -- Camp
    ['enter_build_mode'] = 'სამშენებლო რეჟიმის შესვლა',
    ['exit_build_mode'] = 'სამშენებლო რეჟიმიდან გამოსვლა',
    ['place_structure'] = 'სტრუქტურის განთავსება',
    ['rotate_structure'] = 'როტაცია: ~INPUT_MOVE_LR~',
    ['confirm_placement'] = 'დადასტურება: ~INPUT_CONTEXT~',
    ['cancel_placement'] = 'გაუქმება: ~INPUT_CANCEL~',
    ['structure_placed'] = 'სტრუქტურა წარმატებით განთავსდა!',
    ['cant_place_here'] = 'აქ სტრუქტურის განთავსება შეუძლებელია',
    ['too_close_to_structure'] = 'ძალიან ახლოს არის სხვა სტრუქტურასთან',
    ['outside_camp_radius'] = 'ბანაკის რადიუსს გარეთ',
    ['terrain_not_suitable'] = 'რელიეფი შეუფერებელია',
    ['pack_up_camp'] = 'ბანაკის აღება',
    ['confirm_pack_up'] = 'დარწმუნებული ხართ, რომ გსურთ ამ ბანაკის აღება?',
    ['camp_packed_up'] = 'ბანაკი წარმატებით აღებულია',
    ['pack_up_cooldown'] = 'უნდა დაელოდოთ ბანაკის აღებამდე',
    
    -- Employees
    ['hire_employee'] = 'თანამშრომლის დაქირავება',
    ['fire_employee'] = 'თანამშრომლის გათავისუფლება',
    ['set_wage'] = 'ხელფასის დაყენება',
    ['employee_hired'] = '%s წარმატებით დაიქირავა!',
    ['employee_fired'] = '%s გათავისუფლდა',
    ['wage_updated'] = 'ხელფასი განახლდა %s/საათი',
    ['cant_afford_wage'] = 'ბიზნესს არ შეუძლია ამ ხელფასის გადახდა',
    ['max_employees'] = 'მიაღწიეთ თანამშრომლების მაქსიმალურ რაოდენობას',
    ['not_owner'] = 'თქვენ არ ხართ ამ ბიზნესის მფლობელი',
    ['no_permission'] = 'თქვენ არ გაქვთ ნებართვა ამის გაკეთებისთვის',
    
    -- NPCs
    ['hire_npc'] = 'NPC-ის დაქირავება',
    ['fire_npc'] = 'NPC-ის გათავისუფლება',
    ['npc_hired'] = 'NPC წარმატებით დაიქირავა!',
    ['npc_fired'] = 'NPC გათავისუფლდა',
    ['npc_working'] = 'მუშაობს...',
    ['npc_idle'] = 'უმოქმედო',
    ['npc_on_break'] = 'შესვენებაზე',
    
    -- Vehicles
    ['purchase_vehicle'] = 'ტრანსპორტის შეძენა',
    ['vehicle_purchased'] = 'ტრანსპორტი შეძენილია!',
    ['load_cargo'] = 'ტვირთის ჩატვირთვა',
    ['unload_cargo'] = 'ტვირთის გადმოტვირთვა',
    ['cargo_loaded'] = 'ჩატვირთულია %sx %s',
    ['cargo_unloaded'] = 'ტვირთი გადმოტვირთულია',
    ['vehicle_full'] = 'ტრანსპორტი სავსეა',
    ['vehicle_empty'] = 'ტრანსპორტი ცარიელია',
    ['vehicle_overloaded'] = 'ტრანსპორტი გადატვირთულია!',
    ['vehicle_damaged'] = 'ტრანსპორტი დაზიანებულია',
    ['repair_vehicle'] = 'ტრანსპორტის შეკეთება',
    
    -- Missions
    ['accept_mission'] = 'მისიის მიღება',
    ['cancel_mission'] = 'მისიის გაუქმება',
    ['mission_accepted'] = 'მისია მიღებულია!',
    ['mission_cancelled'] = 'მისია გაუქმდა',
    ['mission_completed'] = 'მისია დასრულდა! ჯილდო: %s',
    ['mission_failed'] = 'მისია ვერ შედგა',
    ['mission_expired'] = 'მისიის ვადა ამოიწურა',
    ['deliver_cargo'] = 'ტვირთის მიწოდება',
    ['mission_progress'] = 'პროგრესი: %s/%s',
    ['time_remaining'] = 'დარჩენილი დრო: %s',
    
    -- Skills
    ['skill_increased'] = '%s უნარი გაიზარდა %s დონემდე!',
    ['level_up'] = 'დონის ამაღლება!',
    ['xp_gained'] = '+%s XP',
    ['skill_title'] = 'წოდება: %s',
    ['view_skills'] = 'უნარების ნახვა',
    ['unlock_available'] = 'ახალი განბლოკვა ხელმისაწვდომია!',
    
    -- Shops
    ['open_shop'] = 'მაღაზიის გახსნა',
    ['buy_item'] = 'ყიდვა',
    ['sell_item'] = 'გაყიდვა',
    ['item_purchased'] = 'შეძენილია %sx %s %s-ისთვის',
    ['item_sold'] = 'გაიყიდა %sx %s %s-ისთვის',
    ['out_of_stock'] = 'მარაგი ამოწურულია',
    ['market_prices'] = 'ბაზრის ფასები',
    
    -- UI
    ['confirm'] = 'დადასტურება',
    ['cancel'] = 'გაუქმება',
    ['close'] = 'დახურვა',
    ['back'] = 'უკან',
    ['next'] = 'შემდეგი',
    ['previous'] = 'წინა',
    ['amount'] = 'რაოდენობა',
    ['total'] = 'სულ',
    ['balance'] = 'ბალანსი',
    
    -- Notifications
    ['success'] = 'წარმატება',
    ['error'] = 'შეცდომა',
    ['warning'] = 'გაფრთხილება',
    ['info'] = 'ინფორმაცია'
}

return Locale
