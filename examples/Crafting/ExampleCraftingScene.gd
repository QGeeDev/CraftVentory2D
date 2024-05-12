extends Node2D

@onready var inventory_interface: Control = $UI/InventoryInterface
@onready var player_data = $PlayerData

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory_interface.set_inventory_data(player_data.inventory_data)
	player_data.toggle_inventory_visible.connect(toggle_inventory_view)

func toggle_inventory_view(external_inventory_owner = null) -> void:
	inventory_interface.visible = !inventory_interface.visible
	if external_inventory_owner and inventory_interface.visible:
		inventory_interface.set_external_inventory(external_inventory_owner)
	else:
		inventory_interface.clear_external_inventory()

func toggle_crafting_view(crafting_station_owner = null) -> void:
	if crafting_station_owner and inventory_interface.visible:
		inventory_interface.set_crafting_station(crafting_station_owner)
	else:
		inventory_interface.clear_crafting_station() 
