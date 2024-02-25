extends Node

@export var inventory_data: InventoryData

signal toggle_inventory_visible()

func _unhandled_input(event: InputEvent) -> void:
	if(Input.is_action_just_pressed("toggle_inventory_view")):
		toggle_inventory_visible.emit()
