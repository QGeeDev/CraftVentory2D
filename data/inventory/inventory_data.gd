class_name InventoryData
extends Resource

@export var inventory_slots: Array[InventorySlot] = [];

func on_slot_clicked(index: int, button: int):
	print_debug("Inventory interact")
