class_name InventorySlot
extends Resource

const MAX_STACK_SIZE: int = 64;

@export var item_data: ItemData;
@export_range(1, MAX_STACK_SIZE) var quantity: int = 1 : set = set_quantity;

func set_quantity(val: int) -> void:
	quantity = val;
	
	if quantity > 1 and not item_data.stackable:
		quantity = 1;
		push_warning("%s not stackable, setting quantity to 1" % item_data.name);
