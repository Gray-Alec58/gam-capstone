extends Node

#creating variables fro reasearch points based on button clicks
var points: int = 0
func add_points() -> void:
	points += 1

#tracking animals being unlocked
signal chicken_unlocked_changed
var total_chickens: int = 0
var chicken_unlocked: bool = false
func unlock_chicken() -> void:
	chicken_unlocked = true
	chicken_unlocked_changed.emit()
func get_total_chicken():
	total_chickens+=1

signal pig_unlocked_changed
var total_pigs: int = 0
var pig_unlocked: bool = false
func unlock_pig() -> void:
	pig_unlocked = true
	pig_unlocked_changed.emit()
func get_total_pig():
	total_pigs+=1

#for back button; going back to previous scene

var scene_history: Array[String] = []
func open_scene(path: String) -> void:
	var current = get_tree().current_scene
	if current != null:
		var current_path = current.scene_file_path
		if current_path !="":
			scene_history.append(current_path)
	get_tree().change_scene_to_file(path)
func go_back() -> void:
	if scene_history.is_empty():
		return
	var previous_path = scene_history.pop_back()
	get_tree().change_scene_to_file(previous_path)

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
