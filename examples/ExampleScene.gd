extends Node2D

@onready var inventory_interface: Control = $UI/PlayerInventoryInterface
@onready var player_data = $PlayerData



# Called when the node enters the scene tree for the first time.
func _ready():
	inventory_interface.set_inventory_data(player_data.inventory_data)

	
func toggle_inventory_view() -> void:
	inventory_interface.visible = !inventory_interface.visible;

