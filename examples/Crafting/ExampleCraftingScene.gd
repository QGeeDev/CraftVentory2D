extends Node2D

@onready var inventory_interface: Control = $UI/InventoryInterface
@onready var player_data = $PlayerData

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_crafting_station_toggle_crafting_visible(external_inventory_owner):
	print_debug("Interacted with crafting table")
