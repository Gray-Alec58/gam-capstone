extends MarginContainer



#When build slot is pressed Builing tab appears
func _on_build_slot_1_text_b_pressed() -> void:
	$BuildtabContainer.visible = true


func _on_back_arrow_text_b_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Map_Scene.tscn")
