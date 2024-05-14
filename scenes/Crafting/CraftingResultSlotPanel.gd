extends InventorySlotPanel
class_name CraftingResultSlotPanel

signal crafting_result_slot_clicked(slotPanel: CraftingResultSlotPanel, index: int, button: int)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton \
		and (event.button_index == MOUSE_BUTTON_LEFT \
		or event.button_index == MOUSE_BUTTON_RIGHT) \
		and event.is_pressed():
			crafting_result_slot_clicked.emit(self, get_index(), event.button_index)
