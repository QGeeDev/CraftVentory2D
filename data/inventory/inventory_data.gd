class_name InventoryData
extends Resource

signal inventory_interact(inventory_data: InventoryData, index: int, button: int)
signal inventory_updated(inventory_data: InventoryData)

@export var inventory_slots: Array[InventorySlot] = [];

func on_slot_clicked(index: int, button: int) -> void:
	inventory_interact.emit(self, index, button)
	
func get_slot_data(index: int) -> InventorySlot:
	var slot = inventory_slots[index]
	
	if slot != null:
		inventory_slots[index] = null
		inventory_updated.emit(self)
		return slot
	else:
		return null
		
func set_slot_data(slot_data: InventorySlot, index:int) -> InventorySlot:
	var slot = inventory_slots[index]
	inventory_slots[index] = slot_data
	inventory_updated.emit(self)
	
	if slot != null:
		return slot
	else:
		return null
