extends Sprite2D


#Go back to Map scene
func _on_back_text_button_pressed() -> void:
	GlobalScript.go_back()

#When enclosure is built in build scene updates also in animal Stat scene
func _ready():
	update_enclosures()
	restore_enclosure_chickens()
	inventory_panel.hide()

func update_enclosures():
	for i in range(1,5):
		var enclosure_id = "Enclosure" + str(i)
		var enclosure_node = get_node_or_null("%SmallEnclosure" + str(i))
		if enclosure_node != null:
			if GlobalScript.build_enclosure.has(enclosure_id):
				enclosure_node.visible = true
			else:
				enclosure_node.visible = false

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
	GlobalScript.enclosure_chickens["SmallEnclosure1"].append(chicken_name)
	add_chicken_to_enclosure(%SmallEnclosure1,GlobalScript.enclosure_chickens["SmallEnclosure1"].size() - 1)
	GlobalScript.rescued_chickens.remove_at(chicken_id)
	GlobalScript.selected_chicken_id = -1
	print(chicken_name, "placed in Plot")
	update_inventory()

#func _on_small_enclosure_2_pressed() -> void:
	#var chicken_id = GlobalScript.selected_chicken_id
	#if chicken_id == -1:
		#open_inventory()
		#print("select a chicken first")
		#return
	#if chicken_id < 0 or chicken_id >= GlobalScript.rescued_chickens.size():
		#print("invalid chicken id")
		#return
	#var chicken_name = GlobalScript.rescued_chickens[chicken_id]
	#GlobalScript.rescued_chickens.remove_at(chicken_id)
	#add_chicken_to_enclosure(%SmallEnclosure2,chicken_id)
	#GlobalScript.selected_chicken_id = -1
	#print(chicken_name, "placed in Plot")
	#update_inventory()

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

#func add_chicken_to_enclosure():
	#var id = GlobalScript.enclosure_chickens.size()
	#GlobalScript.enclosure_chickens.append("McChicken")
	#var chicken = enclosure_chicken_scene.instantiate()
	#chicken.setup(%SmallEnclosure1, id)
	#chicken.enclosure = %SmallEnclosure1
	#scene_container.add_child(chicken)
	#chicken.visible = true
	#chicken.global_position = %SmallEnclosure1.get_global_rect().get_center()
	#chicken.play("Idle")

func restore_enclosure_chickens():
	for enclosure_name in GlobalScript.enclosure_chickens:
		var enclosure_node = get_node_or_null("%" + enclosure_name)
		if enclosure_node == null:
			continue
		var chickens = GlobalScript.enclosure_chickens[enclosure_name]
		for i in range(chickens.size()):
			var chicken = enclosure_chicken_scene.instantiate()
			chicken.setup(%SmallEnclosure1, i) 
			scene_container.add_child(chicken)
			chicken.visible = true

func add_chicken_to_enclosure(enclosure_node: Control, id:int):
	var chicken = enclosure_chicken_scene.instantiate()
	chicken.setup(enclosure_node, id)
	enclosure_node.add_child(chicken)
	chicken.visible = true
