extends PanelContainer

@onready var texture_rect = $MarginContainer/TextureRect
@onready var quantity_label = $QuantityLabel

var slot_data: InventorySlot

func set_slot(slotData: InventorySlot) -> void:
	var item_data = slotData.item_data
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]
	texture_rect.texture = item_data.texture
	
	if(slotData.quantity > 1):
		quantity_label.text = "x%s" % slotData.quantity
		quantity_label.show()
