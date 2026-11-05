extends Sprite2D


#Go back to Map scene
func _on_back_text_button_pressed() -> void:
	GlobalScript.go_back()

#When enclosure is built in build scene updates also in animal Stat scene
func _ready():
	if GlobalScript.have_enclosure == true:
		GlobalScript. build_enclosure ["Enclosure1"] = "small_enclosure1"
		update_enclosure_1()
		inventory_panel.hide()

func update_enclosure_1():
	if GlobalScript.build_enclosure.has("Enclosure1"):
		$SceneContainer/EnclosureContainer/TopEnclosureContainer/TopRowControl/SmallEnclosure1.visible = true

#When small enclosure is pressed show Animal stat Ui
func _on_small_enclosure_1_pressed() -> void:
	open_inventory()

@export var chicken_icon_scene: PackedScene
@onready var inventory_panel = $SceneContainer/AnimalInvPatch
@onready var chicken_grid = $SceneContainer/AnimalInvPatch/MarginContainer/VBoxContainer/ChickenContainer

func open_inventory():
	inventory_panel.show()
	update_inventory()

func close_inventory():
	inventory_panel.hide()

func update_inventory():
	for child in chicken_grid.get_children():
		child.queue_free()
	for i in range(GlobalScript.rescued_chickens.size()):
		var icon = chicken_icon_scene.instantiate()
		chicken_grid. add_child(icon)
		icon.setup(i)
