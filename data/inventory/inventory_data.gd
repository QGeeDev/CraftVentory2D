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
	
	var to_return: InventorySlot
	if(slot != null and slot.can_merge_fully(slot_data)):
		slot.merge_inventory_slot(slot_data)
	else:
		inventory_slots[index] = slot_data
		to_return = slot
		
	inventory_updated.emit(self)
	return to_return
	
func create_single_slot_data(slot_data: InventorySlot, index: int) -> InventorySlot:
	var slot = inventory_slots[index]
	
	if slot == null:
		inventory_slots[index] = slot_data.create_single_slot_data()
	elif slot.can_merge(slot_data):
		slot.merge_inventory_slot(slot_data.create_single_slot_data())
	
	inventory_updated.emit(self)
	
	if slot_data.quantity > 0:
		return slot_data
	return null
