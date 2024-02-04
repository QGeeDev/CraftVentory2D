class_name InventorySlot
extends Resource

const MAX_STACK_SIZE: int = 64;

@export var item_data: ItemData;
@export_range(1, MAX_STACK_SIZE) var quantity: int = 1;
