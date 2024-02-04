extends PanelContainer

const INVENTORY_SLOT = preload("res://scenes/InventorySlot.tscn")

@onready var item_grid = $MarginContainer/ItemGrid

func _ready():
	var inventory_data = preload("res://examples/resources/inventory/ExampleInventory.tres")
	create_item_grid(inventory_data.inventory_slots);

func create_item_grid(slots : Array[InventorySlot]) -> void:
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot in slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		item_grid.add_child(new_slot)
