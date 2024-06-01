extends Control

@onready var inventory = $Inventory
@onready var held_slot = $SelectedSlot
@onready var crafting_station = $CraftingStation

var held_slot_data: InventorySlot
var crafting_station_owner

func _physics_process(delta: float) -> void:
	if(held_slot.visible):
		held_slot.global_position = get_global_mouse_position() + Vector2(4,4)

func set_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_interact.connect(_on_inventory_interact)
	inventory.set_inventory_data(inventory_data)
	
func _on_inventory_interact(inventory_data: InventoryData, index: int, button: int, read_only: bool = false) -> void:
	match[held_slot_data, button]:
		[null, MOUSE_BUTTON_LEFT]:
			held_slot_data = inventory_data.get_slot_data(index)
		[_, MOUSE_BUTTON_LEFT]:
			if(!read_only):
				held_slot_data = inventory_data.set_slot_data(held_slot_data, index)
		[null, MOUSE_BUTTON_RIGHT]:
			inventory_data.use_slot_data(index)
		[_, MOUSE_BUTTON_RIGHT]:
			held_slot_data = inventory_data.create_single_slot_data(held_slot_data, index)
			
	update_selected_slot()
	
func update_selected_slot() -> void:
	if(held_slot_data!=null):
		held_slot.set_slot(held_slot_data)
		held_slot.show()
	else:
		held_slot.hide()
		
		
func set_crafting_station(crafting_station_owner) -> void:
	var inventory_data = crafting_station_owner.inventory_data
	inventory_data.inventory_interact.connect(_on_inventory_interact)
	crafting_station.set_inventory_data(inventory_data)
	
	var result_inventory_data = crafting_station_owner.result_inventory
	result_inventory_data.inventory_interact.connect(_on_inventory_interact)
	crafting_station.set_result_inventory_data(result_inventory_data)
	crafting_station.show()


func clear_crafting_station() -> void:
	if crafting_station_owner != null:
		var inventory_data = crafting_station_owner.inventory_data
		inventory_data.inventory_interact.disconnect(_on_inventory_interact)
		crafting_station.clear_inventory_data(inventory_data)
		crafting_station.hide()
		crafting_station_owner = null
		
