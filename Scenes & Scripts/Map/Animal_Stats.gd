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
		restore_enclosure_chickens()
	inventory_panel.hide()
	%ChickenSprite.hide()

func update_enclosure_1():
	if GlobalScript.build_enclosure.has("Enclosure1"):
		%SmallEnclosure1.visible = true

func update_chicken_position():
	if GlobalScript.chicken_position.has("McChicken1"):
		%ChickenSprite.position = GlobalScript.chicken_position["McChicken1"]


#When small enclosure is pressed show inventory
#chicekn can be plced in enclosure
var enclosure_chickens = []
@export var chicken_icon_scene: PackedScene
@export var enclosure_chicken_scene: PackedScene
@onready var inventory_panel = $SceneContainer/AnimalInvPatch
@onready var chicken_grid = %ChickenContainer
@onready var scene_container = %SceneContainer

func _on_small_enclosure_1_pressed() -> void:
	var chicken_id = GlobalScript.selected_chicken_id
	if chicken_id == -1:
		open_inventory()
		print("select a chicken first")
		return
	if chicken_id < 0 or chicken_id >= GlobalScript.rescued_chickens.size():
		print("invalid chicken id")
		return
	var chicken_name = GlobalScript.rescued_chickens[chicken_id]
	GlobalScript.rescued_chickens.remove_at(chicken_id)
	add_chicken_to_enclosure()
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

func add_chicken_to_enclosure():
	var id = GlobalScript.enclosure_chickens.size()
	GlobalScript.enclosure_chickens.append("McChicken")
	var chicken = enclosure_chicken_scene.instantiate()
	chicken.setup(%SmallEnclosure1, id)
	chicken.enclosure = %SmallEnclosure1
	scene_container.add_child(chicken)
	chicken.visible = true
	chicken.global_position = %SmallEnclosure1.get_global_rect().get_center()
	chicken.play("Idle")

func restore_enclosure_chickens():
	for i in range(GlobalScript.enclosure_chickens.size()):
		var chicken = enclosure_chicken_scene.instantiate()
		chicken.setup(%SmallEnclosure1, i) 
		scene_container.add_child(chicken)
		chicken.visible = true
		if GlobalScript.chicken_position.has(i):
			chicken.global_position = GlobalScript.chicken_position[i]
