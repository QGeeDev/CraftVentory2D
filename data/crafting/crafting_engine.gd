extends Resource
class_name CraftingEngine

@export var _recipes: Array[CraftingRecipe] = []

func add_recipe(recipe: CraftingRecipe) -> void:
	_recipes.append(recipe)

func is_valid_recipe(components: Array[InventorySlot]) -> bool:
	for recipe in _recipes:
		if _check_recipe_match(components, recipe):
			return true
	return false

# TODO: Check if possible to have default case be return false, prevent false positive matches
func _check_recipe_match(inputComponents: Array[InventorySlot], recipe: CraftingRecipe) -> bool:
	var recipeComponents = recipe.components
	if recipeComponents.size() != inputComponents.size():
		return false

	for i in recipeComponents.size():
		var recipeSlot = recipeComponents[i]
		var inputSlot = inputComponents[i]
		
		if((inputSlot && !recipeSlot) || (recipeSlot && !inputSlot)):
			return false
		
		if(inputSlot==null && recipeSlot == null):
			return true

		if(recipeSlot.item_data.id != inputSlot.item_data.id):
			return false
		
		if(recipeSlot.quantity > inputSlot.quantity):
			return false

	return true
