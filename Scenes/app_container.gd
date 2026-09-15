extends VBoxContainer

#apps
@export var research: Button
@export var rescue: Button
@export var build: Button
@export var fundraise: Button

#windows
@export var researchWindow1: MarginContainer
@export var researchWindow2: MarginContainer
@export var rescueWindow: MarginContainer
@export var expandWindow: MarginContainer
@export var fundraiseWindow: MarginContainer

#app pressed variables
var researchPressed: bool = false
var rescuePressed: bool = false
var buildPressed: bool = false
var fundraisePressed: bool = false

func toggle_visibility(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true

func _on_research_app_pressed() -> void:
	toggle_visibility(researchWindow1)
	if researchWindow2.visible:
		toggle_visibility(researchWindow2)

func _on_farm_animals_button_pressed() -> void:
	toggle_visibility(researchWindow2)
	if researchWindow1.visible:
		toggle_visibility(researchWindow1)

func _on_rescue_app_pressed() -> void:
	toggle_visibility(rescueWindow)

func _on_build_app_pressed() -> void:
	toggle_visibility(expandWindow)

func _on_fundraise_app_pressed() -> void:
	toggle_visibility(fundraiseWindow)
