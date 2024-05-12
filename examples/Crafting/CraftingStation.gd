extends Node2D

@export var engine: CraftingEngine
@export var inventory_data: InventoryData
@export var result_slot: InventorySlot

signal toggle_crafting_visible(_crafting_station_owner)

func _on_area_2d_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		toggle_crafting_visible.emit(self)
