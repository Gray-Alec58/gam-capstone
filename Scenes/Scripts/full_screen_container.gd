extends MarginContainer

@export var ResearchWindow1: MarginContainer
@export var ResearchWindow2: MarginContainer
@export var RescueWindow: MarginContainer
@export var ExpandWindow: MarginContainer
@export var FundraiseWindow: MarginContainer

func _on_research_texture_button_pressed() -> void:
	ResearchWindow1.visible = true
	ResearchWindow2.visible = false
	RescueWindow.visible = false
	ExpandWindow.visible = false
	FundraiseWindow.visible = false

func _on_rescue_texture_button_pressed() -> void:
	ResearchWindow1.visible = false
	ResearchWindow2.visible = false
	RescueWindow.visible = true
	ExpandWindow.visible = false
	FundraiseWindow.visible = false

func _on_build_texture_button_pressed() -> void:
	ResearchWindow1.visible = false
	ResearchWindow2.visible = false
	RescueWindow.visible = false
	ExpandWindow.visible = true
	FundraiseWindow.visible = false

func _on_fundraise_texture_button_pressed() -> void:
	ResearchWindow1.visible = false
	ResearchWindow2.visible = false
	RescueWindow.visible = false
	ExpandWindow.visible = false
	FundraiseWindow.visible = true

func _on_farm_animal_texture_button_pressed() -> void:
	ResearchWindow1.visible = false
	ResearchWindow2.visible = true
	RescueWindow.visible = false
	ExpandWindow.visible = false
	FundraiseWindow.visible = false
