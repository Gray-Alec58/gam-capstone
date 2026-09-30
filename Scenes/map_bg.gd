extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#When starter plot is pressed goes to building scene
func _on_starter_plot_text_b_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Building_Ui.tscn")
