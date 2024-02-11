class_name InventoryData
extends Resource

signal inventory_interact(inventory_data: InventoryData, index: int, button: int)

@export var inventory_slots: Array[InventorySlot] = [];

func on_slot_clicked(index: int, button: int) -> void:
	inventory_interact.emit(self, index, button)
