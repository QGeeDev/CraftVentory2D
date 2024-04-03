extends Resource
class_name CraftingEngine

const ANY_IDENTIFIER = "*"

var _recipes: Array[CraftingRecipe] = []

func add_recipe(recipe: CraftingRecipe) -> void:
	_recipes.append(recipe)

func is_valid_recipe(components: Array[AbstractItem]) -> bool:
	for recipe in _recipes:
		if check_recipe_match(components, recipe):
			return true
	return false

func check_recipe_match(inputComponents: Array[AbstractItem], recipe: CraftingRecipe) -> bool:
	var recipeComponents = recipe.components
	if recipeComponents.size() != inputComponents.size():
		return false

	for i in recipeComponents.size():
		var recipeItem = recipeComponents[i]
		var inputItem = inputComponents[i]

		if(recipeItem.category != inputItem.category):
			return false

		if(recipeItem.id != inputItem.id && recipeItem.id != ANY_IDENTIFIER):
			return false

	return true
