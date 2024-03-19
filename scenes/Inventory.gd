extends PanelContainer

const INVENTORY_SLOT = preload("res://scenes/InventorySlot.tscn")

@onready var item_grid = $MarginContainer/ItemGrid

func set_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_updated.connect(create_item_grid)
	create_item_grid(inventory_data)
	
func clear_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_updated.disconnect(create_item_grid)

func create_item_grid(inventory_data: InventoryData) -> void:
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot in inventory_data.inventory_slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		item_grid.add_child(new_slot)
		
		new_slot.slot_clicked.connect(inventory_data.on_slot_clicked)
		
		if slot != null:
			new_slot.set_slot(slot)
