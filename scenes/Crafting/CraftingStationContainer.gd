extends InventoryContainer
class_name CraftingStationContainer


func create_item_grid(inventory_data: InventoryData) -> void:
	super(inventory_data)
	var result_slot = INVENTORY_SLOT.instantiate();
	result_slot.read_only = true
	inventory_data.inventory_slots.append(result_slot)
	result_slot.slot_clicked.connect(inventory_data.on_slot_clicked)
