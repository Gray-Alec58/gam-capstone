extends Node2D

func _on_body_click_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$CatPaw.play("Grab")


func _on_toy_detector_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_toy_detector_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_toy_detector_area_entered(area: Area2D) -> void:
	if area.name == "ToyMouse":
		$CatPaw.play("Grab")


func _on_toy_detector_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
