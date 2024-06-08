extends Node2D

@export var engine: CraftingEngine
@export var inventory_data: InventoryData
@export var result_inventory: CraftingResultInventoryData

signal toggle_crafting_visible(_crafting_station_owner)

func _ready():
	inventory_data.inventory_updated.connect(check_crafting_recipes)
	result_inventory.crafting_actioned.connect(action_crafting)

func _on_area_2d_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		toggle_crafting_visible.emit(self)
		
func check_crafting_recipes(recipe_inventory_data: InventoryData) -> void:
	result_inventory.clear_slot_data(0)
	var recipe_output = engine.get_crafting_recipe(recipe_inventory_data.inventory_slots)
	
	if recipe_output:
		result_inventory.set_slot_data(recipe_output, 0)

func action_crafting(result_inventory_data: InventoryData) -> void:
	engine.action_active_recipe(inventory_data, result_inventory_data)
