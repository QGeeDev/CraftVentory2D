extends Resource
class_name CraftingEngine

@export var _recipes: Array[CraftingRecipe] = []

var active_recipe: CraftingRecipe

func add_recipe(recipe: CraftingRecipe) -> void:
	_recipes.append(recipe)

func get_crafting_recipe(components: Array[InventorySlot]) -> InventorySlot:
	active_recipe = null
	for recipe in _recipes:
		var output_recipe = _check_recipe(components, recipe)
		if output_recipe:
			active_recipe = output_recipe
			return output_recipe.output.duplicate()
	return null

func action_active_recipe(inventory_data: InventoryData, result_inventory_data: CraftingResultInventoryData) -> bool:
	## Confirm active recipe is match
	var components = inventory_data.inventory_slots
	if(!_check_recipe(components, active_recipe)):
		push_warning("Active recipe is not valid for input components. Setting active recipe to null.")
		active_recipe = null
		return false
	
	var recipe_components = active_recipe.components
	for idx in active_recipe.components.size():
		components[idx].quantity -= recipe_components[idx].quantity
		if(components[idx].quantity <= 0):
			components[idx] = null
	
	inventory_data.inventory_updated.emit(inventory_data)
	return true

# TODO: Check if possible to have default case be return false, prevent false positive matches
func _check_recipe(inputComponents: Array[InventorySlot], recipe: CraftingRecipe) -> CraftingRecipe:
	var recipeComponents = recipe.components
	if recipeComponents.size() != inputComponents.size():
		return null

	for i in recipeComponents.size():
		var recipeSlot = recipeComponents[i]
		var inputSlot = inputComponents[i]
		
		if(inputSlot==null && recipeSlot == null):
			continue
		
		if((inputSlot && !recipeSlot) || (recipeSlot && !inputSlot)):
			return null
		
		if(recipeSlot.item_data.id != inputSlot.item_data.id):
			return null
		
		if(recipeSlot.quantity > inputSlot.quantity):
			return null
	
	return recipe
