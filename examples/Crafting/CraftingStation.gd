extends Node2D

@export var engine: CraftingEngine
@export var componentsSlots: Array[InventorySlot]
@export var craftingResult: InventorySlot

signal toggle_crafting_visible(external_inventory_owner)

func _on_area_2d_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		toggle_crafting_visible.emit(self)
