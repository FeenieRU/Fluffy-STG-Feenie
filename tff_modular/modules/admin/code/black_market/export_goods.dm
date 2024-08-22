/*
	FF MODULAR: ADMIN BLACK MARKET
	Предметы и позиции, добавленные педально через панель
*/
/datum/market_item/export_good
	category = "Exported Goods"
	abstract_path = /datum/market_item/export_good
	stock = 1
	availability_prob = 100
	restockable = FALSE

/datum/market_item/export_good/New(atom/movable/thing, item_name, item_description, item_price)
	..()
	set_item(thing)
	name = "[item_name]"
	desc = "[item_description]"
	price = item_price
