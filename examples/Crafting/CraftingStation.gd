extends Node2D

@export var engine: CraftingEngine
@export var inventory_data: InventoryData
@export var result_inventory: InventoryData

signal toggle_crafting_visible(_crafting_station_owner)

func _ready():
	inventory_data.inventory_updated.connect(check_crafting_recipes)

func _on_area_2d_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		toggle_crafting_visible.emit(self)
		
func check_crafting_recipes(recipe_inventory_data: InventoryData):
	print_debug("Check Crafting Recipes called")
	engine.is_valid_recipe(recipe_inventory_data.inventory_slots)
