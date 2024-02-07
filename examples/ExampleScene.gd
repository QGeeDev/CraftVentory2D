extends Node2D

@onready var inventory_interface: Control = $UI/InventoryInterface
@onready var loot_chest: Node2D = $LootChest



# Called when the node enters the scene tree for the first time.
func _ready():
	loot_chest.toggle_inventory_visible.connect(toggle_inventory_view)
	inventory_interface.set_inventory_data(loot_chest.inventory_data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func toggle_inventory_view() -> void:
	inventory_interface.visible = !inventory_interface.visible;

