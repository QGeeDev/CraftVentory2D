extends InventoryData
class_name CraftingResultInventoryData

signal crafting_actioned(inventory_data: CraftingResultInventoryData)

func on_crafting_result_slot_clicked(index: int, button: int) -> void:
	super.on_read_only_slot_clicked(index, button)
	crafting_actioned.emit(self)
