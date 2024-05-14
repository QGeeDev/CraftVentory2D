extends InventoryContainer
class_name CraftingStationContainer

const CRAFTING_RESULT_SLOT = preload("res://scenes/Crafting/CraftingResultSlotPanel.tscn")

func create_item_grid(inventory_data: InventoryData) -> void:
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot in inventory_data.inventory_slots:
		var new_slot: CraftingResultSlotPanel = CRAFTING_RESULT_SLOT.instantiate()
		item_grid.add_child(new_slot)
		new_slot.crafting_result_slot_clicked.connect(inventory_data.on_read_only_slot_clicked)
		
		if slot != null:
			new_slot.set_slot(slot)
