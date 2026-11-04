extends Control

@onready var button = $Button
@onready var audio_player = $AudioStreamPlayer

func _ready():
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	audio_player.play()
 	
