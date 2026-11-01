extends MarginContainer

#variables for each window to be refered to later in code
@export var ResearchWindow1: MarginContainer
@export var ResearchWindow2: MarginContainer
@export var RescueWindow: MarginContainer
@export var ExpandWindow: MarginContainer
@export var FundraiseWindow: MarginContainer
#reserach button reveals the reserach window
#sets visability of other windows to false
func _on_research_texture_button_pressed() -> void:
	ResearchWindow1.visible = true
	ResearchWindow2.visible = false
	RescueWindow.visible = false
	ExpandWindow.visible = false
	FundraiseWindow.visible = false
#rescue button reveals the rescue window
#sets visability of other windows to false
func _on_rescue_texture_button_pressed() -> void:
	ResearchWindow1.visible = false
	ResearchWindow2.visible = false
	RescueWindow.visible = true
	ExpandWindow.visible = false
	FundraiseWindow.visible = false
#build or expand button reveals the build window
#sets visability of other windows to false
func _on_build_texture_button_pressed() -> void:
	ResearchWindow1.visible = false
	ResearchWindow2.visible = false
	RescueWindow.visible = false
	ExpandWindow.visible = true
	FundraiseWindow.visible = false
#fundraise button reveals the fundraise window
#sets visability of other windows to false
func _on_fundraise_texture_button_pressed() -> void:
	ResearchWindow1.visible = false
	ResearchWindow2.visible = false
	RescueWindow.visible = false
	ExpandWindow.visible = false
	FundraiseWindow.visible = true
	if %StartStreamButton.visible == false: #shows animal animation in live stream based whether or not the animal is unlocked and bought
		if GlobalScript.total_chickens >= 1:
			%ChickenSprite.visible = true
		if GlobalScript.total_pigs >=1:
			%PigSprite.visble = true
#farm animal button reveals the second research window
#sets visability of other windows to false
func _on_farm_animal_texture_button_pressed() -> void:
	ResearchWindow1.visible = false
	ResearchWindow2.visible = true
	RescueWindow.visible = false
	ExpandWindow.visible = false
	FundraiseWindow.visible = false

#When build button is pressed goes to map scene
func _on_build_text_b_pressed() -> void:
	GlobalScript.open_scene("res://Scenes/Map_Scene.tscn")
	
	
