extends Sprite2D


#Go back to Map scene
func _on_back_text_button_pressed() -> void:
	GlobalScript.go_back()

#When enclosure is built in build scene updates also in animal Stat scene
func _ready():
	if GlobalScript.have_enclosure == true:
		GlobalScript. build_enclosure ["Enclosure1"] = "small_enclosure1"
		update_enclosure_1()

func update_enclosure_1():
	if GlobalScript.build_enclosure.has("Enclosure1"):
		$SceneContainer/EnclosureContainer/TopEnclosureContainer/TopRowControl/SmallEnclosure1.visible = true

#When small enclosure is pressed show Animal stat Ui
func _on_small_enclosure_1_pressed() -> void:
	$SceneContainer/NinePatchRect.visible = true
