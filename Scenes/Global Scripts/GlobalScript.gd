extends Node

#creating variables fro reasearch points based on button clicks
var points: int = 0
func add_points() -> void:
	points += 1

#tracking animals being unlocked
signal chicken_unlocked_changed
var chicken_unlocked: bool = false
func unlock_chicken() -> void:
	chicken_unlocked = true
	chicken_unlocked_changed.emit()

#for back button; going back to previous scene
var previous_scene_path: String = ""
func _go_to_scene(target_path: String) -> void:
	var current_scene = get_tree().current_scene
	if current_scene:
		previous_scene_path = current_scene.scene_file_path
		get_tree().change_scene_to_file(target_path)
func _go_to_previous_scene() -> void:
	if not previous_scene_path.is_empty():
		var current_path = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file(previous_scene_path)
		previous_scene_path = current_path

#money tracker
signal gold_changed
var gold: int = 500
func gold_decrease(x: int) -> void:
	gold -= x
	gold_changed.emit()
func gold_increase(x: int) -> void:
	gold += x
	gold_changed.emit()

var have_enclosure: bool = false
func built_enclosure() -> void:
	have_enclosure = true
