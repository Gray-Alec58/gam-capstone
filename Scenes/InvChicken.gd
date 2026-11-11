extends Control

var chicken_id: int

@onready var chicken_button = %ChickenButton
@onready var chicken_name = %ChickenName
#for being able to click on chicken
func setup(id: int):
	chicken_id = id
	chicken_name.text = "McChicken" + str(id +1)
	chicken_button.pressed.connect(_on_pressed)

func _on_pressed():
	GlobalScript.selected_chicken_id = chicken_id
	print("Selected chicken ID: ",chicken_id)
