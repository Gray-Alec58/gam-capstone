extends Sprite2D


#Go back to Map scene
func _on_back_text_button_pressed() -> void:
	GlobalScript.go_back()

#When enclosure is built in build scene updates also in animal Stat scene
func _ready():
	if GlobalScript.have_enclosure == true:
		GlobalScript.build_enclosure ["Enclosure1"] = "small_enclosure1"
		update_enclosure_1()
		update_chicken_position()
	inventory_panel.hide()
	

func update_enclosure_1():
	if GlobalScript.build_enclosure.has("Enclosure1"):
		%SmallEnclosure1.visible = true

func update_chicken_position():
	if GlobalScript.chicken_position.has("McChicken1"):
		%ChickenSprite.position = GlobalScript.chicken_position["McChicken1"]
		%ChickenSprite.visible = true


#When small enclosure is pressed show inventory
#chicekn can be plced in enclosure
var occupied = false
var chicken_name = ""
@export var chicken_icon_scene: PackedScene
@onready var inventory_panel = $SceneContainer/AnimalInvPatch
@onready var chicken_grid = %ChickenContainer
@onready var chicken_sprite = %ChickenSprite

func _on_small_enclosure_1_pressed() -> void:
	if occupied: 
		print("This plot is already occupied!")
		return
	var chicken_id = GlobalScript.selected_chicken_id
	if chicken_id == -1:
		open_inventory()
		print("select a chicken first")
		return
	if chicken_id < 0 or chicken_id >= GlobalScript.rescued_chickens.size():
		print("invalid chicken id")
		return
	chicken_name = GlobalScript.rescued_chickens[chicken_id]
	GlobalScript.rescued_chickens.remove_at(chicken_id)
	occupied = true
	chicken_sprite.visible = true
	chicken_sprite.play("Idle")
	GlobalScript.selected_chicken_id = -1
	GlobalScript.chicken_position["McChicken1"] = %ChickenSprite.position
	print(chicken_name, "placed in Plot")
	update_inventory()

func open_inventory():
	inventory_panel.show()
	update_inventory()
func close_inventory():
	inventory_panel.hide()

func update_inventory():
	for child in chicken_grid.get_children():
		child.queue_free()
	print("CHICKENS IN ARRAY: ", GlobalScript.rescued_chickens.size())
	for i in range(GlobalScript.rescued_chickens.size()):
		var icon = chicken_icon_scene.instantiate()
		chicken_grid.add_child(icon)
		icon.setup(i)
	print("ICONS CREATED: ", chicken_grid.get_child_count())
