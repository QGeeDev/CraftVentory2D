extends Control

@onready var inventory = $Inventory
@onready var held_slot = $SelectedSlot

var held_slot_data: InventorySlot

func _physics_process(delta: float) -> void:
	if(held_slot.visible):
		held_slot.global_position = get_global_mouse_position() + Vector2(4,4)

func set_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_interact.connect(_on_inventory_interact)
	inventory.set_inventory_data(inventory_data)
	
func _on_inventory_interact(inventory_data: InventoryData, index: int, button: int) -> void:
	match[held_slot_data, button]:
		[null, MOUSE_BUTTON_LEFT]:
			held_slot_data = inventory_data.get_slot_data(index)
		[_, MOUSE_BUTTON_LEFT]:
			held_slot_data = inventory_data.set_slot_data(held_slot_data, index)
			
	update_selected_slot()
	
func update_selected_slot() -> void:
	if(held_slot_data!=null):
		held_slot.set_slot(held_slot_data)
		held_slot.show()
	else:
		held_slot.hide()
