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

func can_merge(inbound_slot_data: InventorySlot) -> bool:
	return item_data == inbound_slot_data.item_data \
		and item_data.stackable \
		and quantity < MAX_STACK_SIZE

func can_merge_fully(inbound_slot_data: InventorySlot) -> bool:
	return item_data == inbound_slot_data.item_data \
		and item_data.stackable \
		and quantity + inbound_slot_data.quantity <= MAX_STACK_SIZE
		
func create_single_slot_data() -> InventorySlot:
	var new_inventory_slot = duplicate()
	new_inventory_slot.quantity = 1;
	quantity-=1
	return new_inventory_slot

func merge_inventory_slot(inbound_slot_data: InventorySlot) -> void: 
	quantity += inbound_slot_data.quantity
