class_name ItemData
extends AbstractItem

@export var id: String = "";
@export var name: String = "";
@export_multiline var description: String = "";
@export var stackable: bool = false;

@export var texture: Texture2D;


func use(target) -> void:
	#To be used by inheriting classes such as consumableItemData
	pass
