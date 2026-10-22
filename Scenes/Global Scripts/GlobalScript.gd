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
var previous_scene_path: String = ""

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
