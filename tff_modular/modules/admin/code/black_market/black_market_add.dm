/*
	FF MODULAR: ADMIN BLACK MARKET
	Предметы и позиции, добавленные педально через панель
*/

ADMIN_VERB(blackmarket_add, R_ADMIN, "Black Market Add", "Add some goods to black market", ADMIN_CATEGORY_EVENTS)
	user.holder.blackmarket_add()

///Opens up the Panel
/datum/admins/proc/blackmarket_add()

	var/datum/blackmarket_add_panel/ui = new(usr)
	ui.ui_interact(usr)

/// Panel
/datum/blackmarket_add_panel
	var/item_dir
	var/item_name
	var/item_description
	var/item_price
	var/item_count
	var/error

/datum/blackmarket_add_panel/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AdminBlackMarket")
		ui.open()

/datum/blackmarket_add_panel/ui_state(mob/user)
	return GLOB.admin_state

/datum/blackmarket_add_panel/ui_data(mob/user)
	var/list/data = list()
	data["item_dir"] = item_dir
	data["item_name"] = item_name
	data["item_description"] = item_description
	data["item_price"] = item_price
	data["item_count"] = item_count
	data["error"] = error
	return data

/datum/blackmarket_add_panel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	if(.)
		return
	switch(action)
		if("update_dir")
			item_dir = params["updated_item_dir"]
		if("update_name")
			item_name = params["updated_item_name"]
		if("toggle_description")
			item_description = params["updated_item_description"]
		if("update_price")
			item_price = params["updated_item_price"]
		if("update_count")
			item_count = params["updated_item_count"]
		if("place_on_market")
			error = ""
			if(!item_dir)
				error = "ERROR, NO ITEM DIR"
				return
			var/datum/market_item/export_good/new_item = new(item_dir, item_name, item_description, item_price)
			return SSmarket.markets[/datum/market/blackmarket].add_item(new_item)
	return TRUE
