extends Node2D

var change_scene = preload("uid://xh0dirwa0e74")

@onready var StartScreenAnim = $StartScreenAnim/AnimationPlayer
@onready var button =$Background/MenuContainer/VBoxContainer/StartTextB
@export var new_texture: Texture2D

func _ready():
	button.pressed.connect(_on_texture_button_pressed)


#takes player to main lobby or start of game
func _on_texture_button_pressed():
	button.texture_normal = new_texture
	button.texture_hover = new_texture
	$StartScreenAnim.visible = true
	StartScreenAnim.play("StartChickenWalk")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(change_scene)



#closes out of game application
func _on_exit_text_b_pressed() -> void:
	get_tree().quit()
