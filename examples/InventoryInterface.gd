extends Control

@onready var inventory = $Inventory


func set_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_interact.connect(_on_inventory_interact)
	inventory.set_inventory_data(inventory_data)
	
func _on_inventory_interact(inventory_data: InventoryData, index: int, button: int) -> void:
	print_debug("%s %s %s" % [inventory_data, index, button])
