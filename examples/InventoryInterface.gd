extends Control

@onready var inventory = $Inventory


func set_inventory_data(inventory_data: InventoryData) -> void:
	inventory.set_inventory_data(inventory_data)
