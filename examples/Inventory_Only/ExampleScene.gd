xtends Node2D

@onready var inventory_interface: Control = $UI/InventoryInterface
@onready var player_data = $PlayerData



# Called when the node enters the scene tree for the first time.
func _ready():
	inventory_interface.set_inventory_data(player_data.inventory_data)
	player_data.toggle_inventory_visible.connect(toggle_inventory_view)
	
	for node in get_tree().get_nodes_in_group("inventory_containers"):
		node.toggle_inventory_visible.connect(toggle_inventory_view)

	
func toggle_inventory_view(external_inventory_owner = null) -> void:
	inventory_interface.visible = !inventory_interface.visible
	
	if external_inventory_owner and inventory_interface.visible:
		inventory_interface.set_external_inventory(external_inventory_owner)
	else:
		inventory_interface.clear_external_inventory()

