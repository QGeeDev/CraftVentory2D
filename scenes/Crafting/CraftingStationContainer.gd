extends InventoryContainer
class_name CraftingStationContainer

const CRAFTING_RESULT_SLOT = preload("res://scenes/Crafting/CraftingResultSlotPanel.tscn")

@onready var result_grid = $ResultMarginContainer/ResultGrid

func set_result_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_updated.connect(create_result_item_grid)
	create_result_item_grid(inventory_data)
	
func clear_result_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_updated.disconnect(create_result_item_grid)

func create_result_item_grid(inventory_data: InventoryData) -> void:
	for child in result_grid.get_children():
		child.queue_free()
		
	for slot in inventory_data.inventory_slots:
		var new_slot = CRAFTING_RESULT_SLOT.instantiate()
		result_grid.add_child(new_slot)
		new_slot.crafting_result_slot_clicked.connect(inventory_data.on_read_only_slot_clicked)
		
		if slot != null:
			new_slot.set_slot(slot)
