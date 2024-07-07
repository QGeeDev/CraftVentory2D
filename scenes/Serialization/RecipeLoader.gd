extends Node
class_name RecipeLoader

func load_recipe_from_file(filepath: String) -> Array[CraftingRecipe]:
	var fileContent = _load_string_from_file(filepath)
	# validate JSON
	# Parse to recipe list
	# Return
	return []
	
func _load_string_from_file(filepath: String) -> String:
	if(!FileAccess.file_exists(filepath)):
		printerr("File %s not found, cannot load recipes" % filepath);
		return ""
	var file = FileAccess.open(filepath, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content
