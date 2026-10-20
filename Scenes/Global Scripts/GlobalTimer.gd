extends Node

var timer = Timer.new()
var month: int = 1

#GlobalTimer.saved_time_left = $Timer.time_left
#get_tree().change_scene_to_file("res://next_scene.tscn")

func _ready() -> void:
	add_child(timer)
	timer.start(3)
