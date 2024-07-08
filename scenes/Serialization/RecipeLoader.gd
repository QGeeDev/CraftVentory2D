extends Node
class_name RecipeLoader

const DEFAULT_FILE_SAVE = "user://save_data.txt"

var _recipe_component_cache: Dictionary

func load_recipes_from_file(filepath: String) -> Array[CraftingRecipe]:
	_recipe_component_cache = {}
	var file_content = _load_string_from_file(filepath)
	if file_content=="":
		return []
		
	
	var json_content = _get_data_as_json(file_content)
	if(!json_content || json_content.size() ==0):
		return []
	
	var recipes = _parse_json_to_recipes(json_content)
	return []
	
func save_recipes_to_file(recipe_list: Array[CraftingRecipe]) -> bool:
	var json = JSON.new()
	var serialized = json.stringify(recipe_list)
	var file = FileAccess.open(DEFAULT_FILE_SAVE, FileAccess.WRITE_READ)
	file.store_string(serialized)
	return true
	
	
func _load_string_from_file(filepath: String) -> String:
	if(!FileAccess.file_exists(filepath)):
		printerr("File %s not found, cannot load recipes" % filepath);
		return ""
	var file = FileAccess.open(filepath, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content

func _get_data_as_json(json_string: String) -> Array[Dictionary]:
	var json = JSON.new()
	var err = json.parse_string(json_string)
	if err != OK:
		printerr("Failed to parse JSON. File Content may not be valid")
		return []
	return json.data
	
func _parse_json_to_recipes(json_data: Variant):
	pass
