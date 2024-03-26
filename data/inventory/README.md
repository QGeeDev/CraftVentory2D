# Inventory Resources

This folder contains resources that are used as part of an inventory data structure.

## inventory_data.gd

This file defines a resource that is the inventory data. It is named as `inventory_data` as the data is completely abstracted from any UI or other service elements, and contains only the data for the inventory itself.

### Properties

| Property Name     | Type                    | Description                                                                                                   |
|-------------------|-------------------------|---------------------------------------------------------------------------------------------------------------|
| `inventory_slots` | `Array[inventory_slot]` | Acts as the data store for an inventory, allowing the data to be completely separated from the implementation. Docs for `inventory_slot` found [here](#inventory_slotgd) |

### Signals

#### `inventory_updated`
Emitted on change to allow other nodes to update. Used for updating UI elements when inventory is updated.
| Parameter        | Type            | Description                                                                    |
|------------------|-----------------|--------------------------------------------------------------------------------|
| `inventory_data` | `InventoryData` | Used to provide a reference for the InventoryData object that has been updated |

#### `inventory_interact`
Used to provide a signal when an item within the inventory is interacted with
| Parameter        | Type            | Description                                                                            |
|------------------|-----------------|----------------------------------------------------------------------------------------|
| `inventory_data` | `InventoryData` | Used to provide a reference for the InventoryData object that has been interacted with |
| `index`          | `int`           | The index of the specific item in the inventory list that is interacted with.          |
| `button`         | `int`           | The integer value of the button used to interact (e.g. mouse_left_click)               |


### Functions

#### `on_slot_clicked(index, button)` -> `void`
Emits a `inventory_interact` signal if the inventory is interacted with
| Parameter        | Type            | Description                                                                            |
|------------------|-----------------|----------------------------------------------------------------------------------------|
| `index`          | `int`           | The index of the specific item in the inventory list that is interacted with.          |
| `button`         | `int`           | The integer value of the button used to interact (e.g. mouse_left_click)               |


#### `get_slot_data(index)` ->  `InventorySlot`
Gets the inventory slot stored at a specified index of the parameter. Returns `null` if interacted slot is null
| Parameter        | Type            | Description                                                                            |
|------------------|-----------------|----------------------------------------------------------------------------------------|
| `index`          | `int`           | The index of the item in the inventory list to get          |


#### `set_slot_data(slot_data, index)` ->  `InventorySlot`
Gets the inventory slot stored at a specified index of the parameter. Returns `null` if interacted slot is null
| Parameter        | Type            | Description                                                                            |
|------------------|-----------------|----------------------------------------------------------------------------------------|
| `slot_data`          | `InventorySlot`           | The data to insert into the inventory          |
| `index`          | `int`           | The index of the item in the inventory list to set          |


#### `use_slot_data(index)` ->  `void`
If item is of type [`ItemDataConsumable`](../items/item_data_consumable.gd), then executes the `use` function on that item.
| Parameter        | Type            | Description                                                                            |
|------------------|-----------------|----------------------------------------------------------------------------------------|
| `index`          | `int`           | The index of the item in the inventory list to get          |


#### `create_single_slot_data(slot_data, index)` ->  `InventorySlot`
Creates a single instance of a slot data, used for splitting stacked items apart. Emits `inventory_updated`. Returns new single slot data, or `null` if quantity is less than zero at end of run.
| Parameter        | Type            | Description                                                                            |
|------------------|-----------------|----------------------------------------------------------------------------------------|
| `slot_data`          | `InventorySlot`           | The data to create a single slot of. Is nullable.         |
| `index`          | `int`           | The index of the item in the inventory list to add a new item to          |

## inventory_slot.gd

This resource represents a single slot in an inventory, holding the data about the item that's in the slot, and the quantity. It also handles the ability to stack items.

### Properties

| Property Name     | Type                    | Description                                                                                                   |
|-------------------|-------------------------|---------------------------------------------------------------------------------------------------------------|
| `MAX_STACK_SIZE` | `int` | Constant value of 64, to prevent stacks beyond that size |
| `item_data` | `ItemData` | Data object representing the item stored in the inventory slot |
| `quantity` | `int` | In range of 1-64, default 1, number of the item stored in the slot |