extends Node2D

@onready var inventory_interface: Control = $UI/CraftingInventoryInterface
@onready var player_data = $PlayerData

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory_interface.set_inventory_data(player_data.inventory_data)
	player_data.toggle_inventory_visible.connect(toggle_crafting_view)

func toggle_crafting_view(crafting_station_owner = null) -> void:
	inventory_interface.visible = !inventory_interface.visible
	if crafting_station_owner and inventory_interface.visible:
		inventory_interface.set_crafting_station(crafting_station_owner)
	else:
		inventory_interface.clear_crafting_station() 
