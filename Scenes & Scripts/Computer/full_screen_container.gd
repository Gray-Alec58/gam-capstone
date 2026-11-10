extends MarginContainer

#reserach button reveals the reserach window
#sets visability of other windows to false
func _on_research_texture_button_pressed() -> void:
	%"Research Window 1".visible = true
	%"Research Window 2".visible = false
	%"Rescue Window".visible = false
	%"Expand Window".visible = false
	%"Fundraise Window".visible = false
#rescue button reveals the rescue window
#sets visability of other windows to false
func _on_rescue_texture_button_pressed() -> void:
	%"Research Window 1".visible = false
	%"Research Window 2".visible = false
	%"Rescue Window".visible = true
	%"Expand Window".visible = false
	%"Fundraise Window".visible = false
#build or expand button reveals the build window
#sets visability of other windows to false
func _on_build_texture_button_pressed() -> void:
	%"Research Window 1".visible = false
	%"Research Window 2".visible = false
	%"Rescue Window".visible = false
	%"Expand Window".visible = true
	%"Fundraise Window".visible = false
#fundraise button reveals the fundraise window
#sets visability of other windows to false
func _on_fundraise_texture_button_pressed() -> void:
	%"Research Window 1".visible = false
	%"Research Window 2".visible = false
	%"Rescue Window".visible = false
	%"Expand Window".visible = false
	%"Fundraise Window".visible = true
	#if %StartStreamButton.visible == false: #shows animal animation in live stream based whether or not the animal is unlocked and bought
		#if GlobalScript.total_chickens >= 1:
			#%ChickenSprite.visible = true
		#if GlobalScript.total_pigs >=1:
			#%PigSprite.visble = true
#farm animal button reveals the second research window
#sets visability of other windows to false
func _on_farm_animal_texture_button_pressed() -> void:
	%"Research Window 1".visible = false
	%"Research Window 2".visible = true
	%"Rescue Window".visible = false
	%"Expand Window".visible = false
	%"Fundraise Window".visible = false

#When build button is pressed goes to map scene
func _on_build_text_b_pressed() -> void:
	GlobalScript.open_scene("uid://crgu1urlvakw4") #map scene
	
	
