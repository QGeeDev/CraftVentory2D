extends Resource
class_name CraftingEngine

@export var _recipes: Array[CraftingRecipe] = []

func add_recipe(recipe: CraftingRecipe) -> void:
	_recipes.append(recipe)

func get_crafting_result(components: Array[InventorySlot]) -> InventorySlot:
	for recipe in _recipes:
		var output = _check_recipe(components, recipe)
		if output:
			return output
	return null

# TODO: Check if possible to have default case be return false, prevent false positive matches
func _check_recipe(inputComponents: Array[InventorySlot], recipe: CraftingRecipe) -> InventorySlot:
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
	
	var output = recipe.output.duplicate()
	return output
