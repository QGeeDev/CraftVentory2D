extends Node2D

@export var inventory_data: InventoryData

signal toggle_inventory_visible(external_inventory_owner)

func _on_area_2d_input_event(viewport, event, shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():

		toggle_inventory_visible.emit(self)
