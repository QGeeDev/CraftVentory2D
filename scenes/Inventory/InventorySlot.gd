extends PanelContainer
class_name InventorySlotPanel

signal slot_clicked(slotPanel: InventorySlotPanel, index: int, button: int)

@onready var texture_rect = $MarginContainer/TextureRect
@onready var quantity_label = $QuantityLabel

@export var read_only: bool = true

var slot_data: InventorySlot

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton \
		and (event.button_index == MOUSE_BUTTON_LEFT \
		or event.button_index == MOUSE_BUTTON_RIGHT) \
		and event.is_pressed():
			slot_clicked.emit(self, get_index(), event.button_index)

func set_slot(slotData: InventorySlot) -> void:
	var item_data = slotData.item_data
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]
	texture_rect.texture = item_data.texture
	
	if(slotData.quantity > 1):
		quantity_label.text = "x%s" % slotData.quantity
		quantity_label.show()
	else:
		quantity_label.hide()
