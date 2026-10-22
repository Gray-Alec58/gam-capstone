extends Area2D

@export var animated_sprite: AnimatedSprite2D

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			animated_sprite.play("jump")
