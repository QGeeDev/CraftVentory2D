extends ItemData
class_name ItemDataConsumable

@export var attributes: Dictionary = {}

# This is an example of a usable object, such as health potion, weapon, etc
# To do this, 

func use(_target) -> void:
	# To be used by inheriting classes such as consumableItemData
	pass
