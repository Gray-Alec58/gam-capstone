extends Node

#creating variables fro reasearch points based on button clicks
var points: int = 0
func add_points() -> void:
	points += 1

signal chicken_unlocked_changed
var chicken_unlocked: bool = false
func unlock_chicken() -> void:
	chicken_unlocked = true
	chicken_unlocked_changed.emit()

var previous_scene_path: String = ""
